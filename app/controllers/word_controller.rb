class WordController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :forvo]
  before_action :admin_check, only: [:new, :create, :edit, :destroy, :update, :choose_dictionary_contrib]
  before_action :load_lists, if: :user_signed_in?, only: [:show]
  before_action :load_dicts, only: [:new, :choose_dictionary_contrib, :create, :edit]
  before_action :find_dict, only: [:show, :create, :new, :edit, :update, :destroy]
  before_action :load_words_from_dict, only: [:edit, :destroy]

  def show
    @word = @dict.words.find_by_word(params[:id])
    @word.click += 1
    @word.save
  end

  def new
    @new_word = Word.new
    @nat = Nature.where(lang: @dict.lang)
    build_nested
  end

  def create
    @new_word = Word.new(set_params)
    @new_word.dictionary_id = @dict.id
    if @new_word.save
      redirect_to dict_word_path(@dict.lang, @new_word.word)
    else
      render 'new'
    end
  end

  def edit
    params[:id] = params[:search_id] ? params[:search_id] : params[:id]
    @word = @dict.words.find_by_word(params[:id])
    @word = @word ? @word : @dict.words.first
    @nat = Nature.where(lang: @dict.lang)
  end

  def choose_dictionary_contrib

  end

  def forvo
    @word = Word.find_by(word: params[:id])
    res = HTTParty.get("https://apifree.forvo.com/key/#{ENV["FORVO_API"]}/format/json/action/word-pronunciations/word/#{URI.encode(@word.word)}/language/#{@word.dictionary.forvo_ini}")
    render json: res
  end

  def update
    @word = Word.find(params[:id])
    @word.update_attributes(set_params)
    redirect_to dict_word_path(@dict.lang, @word.word)
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to edit_dict_word_path(@dict.lang, @words.first.word)
  end

  private

  def build_nested
    @new_nuance = @new_word.nuances.build
    @new_nuance.specials.build unless @dict.lang == "coréen"
    @new_nuance.exemples.build
    @new_nuance.traductions.build
  end

  def admin_check
    redirect_to root_path unless current_user.status == "admin"
  end

  def load_lists
    @listes = current_user.listes
  end

  def load_dicts
    @dicts = Dictionary.all
  end

  def find_dict
    @dict = Dictionary.find_by(lang: params[:dict_id]) || Dictionary.find(params[:dict_id])
  end

  def load_words_from_dict
    @words = @dict.words
  end

  def set_params
    params.require(:word).permit(
      :word,
      nuances_attributes: [
        :_destroy,
        :id,
        :user_id,
        :nature_fr,
        :nature_cb,
        :remarque,
        :commentaire,
        :order,
        traductions_attributes: [:_destroy, :id, :trad, :order, :precision],
        exemples_attributes: [:_destroy, :id, :exemple_cb, :exemple_fr, :order],
        synonymes_attributes: [:_destroy, :id, :syno, :order],
        antonymes_attributes: [:_destroy, :id, :anto, :order],
        registres_attributes: [:_destroy, :id, :reg, :order],
        variantes_attributes: [:_destroy, :id, :var, :order],
        specials_attributes: [:_destroy, :id, :char, :order]
      ]
    )
  end
end

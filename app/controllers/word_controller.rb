class WordController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
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
    @word = @dict.words.find_by_word(params[:id])
  end

  def choose_dictionary_contrib

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
        traductions_attributes: [:_destroy, :id, :trad],
        exemples_attributes: [:_destroy, :id, :exemple_cb, :exemple_fr],
        synonymes_attributes: [:_destroy, :id, :syno],
        antonymes_attributes: [:_destroy, :id, :anto],
        registres_attributes: [:_destroy, :id, :reg],
        variantes_attributes: [:_destroy, :id, :var],
        specials_attributes: [:_destroy, :id, :char]
      ]
    )
  end
end

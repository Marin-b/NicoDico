class KorWordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show, :index]
  before_action :admin_check, only: :new
  before_action :load_lists, if: :user_signed_in?

  def index
  end

  def search
    @word = Word.where(dict: 2).find_by_word params[:search_word]
    if @word
      redirect_to kor_word_path(@word.word)
    else
      render 'index'
    end
  end

  def edit
    @words = Word.where(dict: 2)
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    @word.nuances.destroy_all
    @word.update(set_params)
    redirect_to kor_word_path(@word.word)
  end

  def show
    @word = Word.find_by_word(params[:id])
    @word.click += 1
    @word.save
  end

  def new
    @new_word = Word.new
    @new_nuance = @new_word.nuances.build
    @new_nuance.specials.build
    @new_nuance.exemples.build
    @new_nuance.antonymes.build
    @new_nuance.synonymes.build
    @new_nuance.registres.build
    @new_nuance.traductions.build
  end

  def create
    @new_word = Word.new(set_params)
    @new_word.save
    redirect_to kor_word_path(@new_word.word)
  end

  def select_word
    @words = Word.where(dict: 2)
  end

  private

  def admin_check
    redirect_to root_path unless current_user.status == "admin"
  end

  def load_lists
    @listes = current_user.listes
  end

  def set_params
    params.require(:word).permit(
      :word,
      nuances_attributes: [
        :_destroy,
        :user_id,
        :nature_fr,
        :nature_cb,
        :remarque,
        :commentaire,
        traductions_attributes: [:trad],
        specials_attributes: [:char],
        exemples_attributes: [:exemple_cb, :exemple_fr],
        synonymes_attributes: [:syno],
        antonymes_attributes: [:anto],
        registres_attributes: [:reg]
      ]
    )
  end
end

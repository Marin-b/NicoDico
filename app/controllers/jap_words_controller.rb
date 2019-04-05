class JapWordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show, :index]
  before_action :admin_check, only: :new
  before_action :load_lists, if: :user_signed_in?

  def index
    @words = Word.where(dict: 1)
  end

  def search
    @words = Word.where(dict: 1)
    @word = @words.find_by_word params[:search_word]
    unless @word
      trad = Traduction.where('trad like ?', params[:search_word]).first
      @word = Word.find(Nuance.find(trad.nuance_id).word_id) if trad
    end
    if @word
      redirect_to jap_word_path(@word.word)
    else
      render 'index'
    end
  end

  def edit
    @words = Word.where(dict: 1)
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    @word.update_attributes(set_params)
    redirect_to jap_word_path(@word.word)
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
    @new_word.dict = 1
    @new_word.save
    redirect_to jap_word_path(@new_word.word)
  end

  def select_word
    @words = Word.where(dict: 1)
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
        registres_attributes: [:_destroy, :id, :reg]
      ]
    )
  end
end

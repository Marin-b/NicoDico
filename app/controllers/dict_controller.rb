class DictController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show, :index]
  before_action :find_dict
  before_action :admin_check, only: [:new, :create, :edit, :destroy, :update]

  def search
    @dict = Dictionary.find_by(lang: params[:dict_id])
    @word = @dict.words.find_by_word params[:search_word]
    unless @word
      trad = Traduction.where('trad like ?', params[:search_word])
      new_trad = (trad.select{ |x| x.nuance.word.dictionary_id == @dict.id }).first
      @word = Word.find(Nuance.find(new_trad.nuance_id).word_id) if new_trad
    end
    if @word
      redirect_to dict_word_path(@dict.lang, @word.word)
    else
      redirect_to dict_path(@dict.lang, search_error: "Le mot <span class='orange'>'#{params[:search_word]}'</span> n'existe pas encore dans notre base de données.<br> Vérifiez qu'il n'y ait pas de fautes d'orthographe.")
    end
  end

  def show
    @words = Word.where(dictionary_id: @dict.id)
    @mot_aleatoire = @words.sample(1).first
    @frequents = @words.order('click DESC').limit(10)
  end

  def word_show
    @word = Word.find_by_word(params[:id])
    @word.click += 1
    @word.save
  end

  private

  def find_dict
    @dict = Dictionary.find_by(lang: params[:id])
  end

  def admin_check
    redirect_to root_path unless current_user.status == "admin"
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
        specials_attributes: [:_destroy, :id, :char],
        exemples_attributes: [:_destroy, :id, :exemple_cb, :exemple_fr],
        synonymes_attributes: [:_destroy, :id, :syno],
        antonymes_attributes: [:_destroy, :id, :anto],
        registres_attributes: [:_destroy, :id, :reg]
      ]
    )
  end
end

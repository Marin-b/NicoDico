class DictController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show, :index]
  before_action :find_dict
  before_action :admin_check, only: [:new, :create, :edit, :destroy, :update]

  def search
    @dict = Dictionary.find_by(lang: params[:dict_id])
    @word = @dict.words.find_by_word(params[:search_word])
    unless @word
      trad = Traduction.where("trad ILIKE ?", params[:search_word])
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

  private

  def find_dict
    @dict = Dictionary.find_by(lang: params[:id])
  end

  def admin_check
    redirect_to root_path unless current_user.status == "admin"
  end
end

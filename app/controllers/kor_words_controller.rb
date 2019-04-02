class KorWordsController < ApplicationController
  before_action :admin_check, only: :new
  def index
  end

  def search
    @word = KorWord.find_by_word params[:search_word]
    if @word
      redirect_to kor_word_path(@word)
    else
      render 'index'
    end
  end

  def show
    @word = KorWord.find(params[:id])
    @word.click += 1
    @word.save
  end

  def new
    @new_word = KorWord.new
    @new_nuance = @new_word.kor_nuances.build
    @new_nuance.hanjas.build
    @new_nuance.kor_exemples.build
    @new_nuance.kor_antonymes.build
    @new_nuance.kor_synonymes.build
    @new_nuance.kor_registres.build
  end

  def create
    @new_word = KorWord.new(set_params)
    @new_word.save
    redirect_to kor_word_path(@new_word)
  end

  private

  def admin_check
    redirect_to root_path unless current_user.status == "admin"
  end

  def set_params
    params.require(:kor_word).permit(
      :word,
      kor_nuances_attributes: [
        :traduction,
        :user_id,
        :nature_francais,
        :nature_cible,
        :remarque,
        :commentaire,
        hanjas_attributes: [:hanja],
        kor_exemples_attributes: [:exemple_cible, :exemple_traduction],
        kor_synonymes_attributes: [:synonyme],
        kor_antonymes_attributes: [:antonyme]
      ]
    )
  end
end

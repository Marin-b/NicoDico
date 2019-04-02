class KorNuancesController < ApplicationController
  def new
    @kor_words = KorWord.all.map{ |w| w.word }
    @kor_nuance = KorNuance.new
    @kor_nuance.hanjas.build
    @kor_nuance.kor_exemples.build
    @kor_nuance.kor_antonymes.build
    @kor_nuance.kor_synonymes.build
    @kor_nuance.kor_registres.build
  end

  def create
    @new_nuance = KorNuance.new(set_params)
    @word = KorWord.where(word: params[:kor_nuance][:kor_word_id]).first
    @new_nuance.kor_word_id = @word.id
    @new_nuance.save
    redirect_to kor_word_path(@word)
  end

  private

   def set_params
    params.require(:kor_nuance).permit(
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
    )
  end
end

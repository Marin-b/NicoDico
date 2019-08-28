class NaturesController < ApplicationController
  def edit
    @new_nat = Nature.new
    @jp_nat = Nature.where(lang: 'japonais')
    @kr_nat = Nature.where(lang: 'coréen')
    @ct_nat = Nature.where(lang: 'chinois traditionnel')
    @cs_nat = Nature.where(lang: 'chinois simplifié')
  end

  def create
    @new_nat = Nature.new(set_params)
    @new_nat.save
    redirect_to natures_path
  end

  def destroy
    @nat = Nature.find(params[:id])
    @nat.destroy
    redirect_to natures_path
  end

  private

  def set_params
    params.require(:nature).permit(:nat_cb, :nat_fr, :lang)
  end
end

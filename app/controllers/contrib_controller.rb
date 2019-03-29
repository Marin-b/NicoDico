class ContribController < ApplicationController
  def choose
    redirect_to root_path unless current_user.status == "admin"
  end

  def new_kor_word
    raise
    new_word = KorWord.create(word: params[:kor_word][:word])
    if params[:kor_word][:kor_nuance]
      contrib_controller = ContribController.new
      contrib_controller.new_nuance_for_new_kor_word(new_word.id, params)
    end
    redirect_to kor_word_path(new_word)
  end

  def new_nuance_for_new_kor_word(new_word_id, param)
    attri = parse_par(param)
    attri["kor_word_id"] = new_word_id
    new_nuance = KorNuance.new(attri)
    if new_nuance.save
      create_relationships(new_nuance.id)
    else
      KorWord.find(new_word_id).destroy
      render 'choose'
    end
  end

  def create_relationships(new_nuance)
    create_hanjas(new_nuance, @new_param["hanjas_attributes"])
    create_kor_exemples(new_nuance, @new_param["kor_exemples_attributes"])
    create_kor_synonymes(new_nuance, @new_param["kor_synonymes_attributes"])
    create_kor_antonymes(new_nuance, @new_param["kor_antonymes_attributes"])
  end

  private

  def parse_par(param)
    @new_param = param["kor_word"]["kor_nuance"]
    { traduction: @new_param[:traduction],
      nature_francais: @new_param[:nature_francais],
      nature_cible: @new_param[:nature_cible],
      remarque: @new_param[:remarque],
      commentaire: @new_param[:commentaire],
      user_id: @new_param[:user_id] }
  end

  def create_hanjas(new_nuance, param)
    param.each do |_k, v|
      x = Hanja.new(hanja: v["hanja"], kor_nuance_id: new_nuance)
      x.save
    end
  end

  def create_kor_exemples(new_nuance, param)
    param.each do |_k, v|
      x = KorExemple.new(exemple_cible: v["exemple_cible"], exemple_traduction: v["exemple_traduction"], kor_nuance_id: new_nuance)
      x.save
    end
  end

  def create_kor_synonymes(new_nuance, param)
    param.each do |_k, v|
      x = KorSynonyme.new(synonyme: v["synonyme"], kor_nuance_id: new_nuance)
      x.save
    end
  end

  def create_kor_antonymes(new_nuance, param)
    param.each do |_k, v|
      x = KorAntonyme.new(antonyme: v["antonyme"], kor_nuance_id: new_nuance)
      x.save
    end
  end
end

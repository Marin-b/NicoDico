class ChangeReferenceOfKorRegistre < ActiveRecord::Migration[5.2]
  def change
    remove_reference :kor_registres, :kor_nuances
    add_reference :kor_registres, :kor_nuance
  end
end

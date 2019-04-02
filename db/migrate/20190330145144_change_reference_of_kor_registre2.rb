class ChangeReferenceOfKorRegistre2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :kor_registres, :kor_nuances
  end
end

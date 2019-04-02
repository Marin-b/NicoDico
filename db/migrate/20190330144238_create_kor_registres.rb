class CreateKorRegistres < ActiveRecord::Migration[5.2]
  def change
    create_table :kor_registres do |t|
      t.references :kor_nuances, foreign_key: true
      t.string :registre

      t.timestamps
    end
  end
end

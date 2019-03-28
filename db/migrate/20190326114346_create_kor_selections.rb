class CreateKorSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :kor_selections do |t|
      t.references :liste, foreign_key: true
      t.references :kor_nuance, foreign_key: true

      t.timestamps
    end
  end
end

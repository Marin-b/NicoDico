class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.references :nuances, foreign_key: true
      t.string :char

      t.timestamps
    end
  end
end

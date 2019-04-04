class CreateNuances < ActiveRecord::Migration[5.2]
  def change
    create_table :nuances do |t|
      t.references :words, foreign_key: true
      t.references :users, foreign_key: true
      t.string :nature_fr
      t.string :nature_cb
      t.text :commentaire
      t.string :remarque

      t.timestamps
    end
  end
end

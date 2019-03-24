class CreateNuances < ActiveRecord::Migration[5.2]
  def change
    create_table :nuances do |t|
      t.references :word, foreign_key: true
      t.references :user, foreign_key: true
      t.string :nature_francais
      t.string :nature_cible
      t.string :traduction
      t.text :commentaire
      t.string :remarque
      t.string :image_url

      t.timestamps
    end
  end
end

class CreateExemples < ActiveRecord::Migration[5.2]
  def change
    create_table :exemples do |t|
      t.references :nuance, foreign_key: true
      t.text :exemple_cible
      t.text :exemple_traduction

      t.timestamps
    end
  end
end

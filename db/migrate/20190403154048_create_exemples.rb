class CreateExemples < ActiveRecord::Migration[5.2]
  def change
    create_table :exemples do |t|
      t.references :nuances, foreign_key: true
      t.string :exemple_fr
      t.string :exemple_cb

      t.timestamps
    end
  end
end

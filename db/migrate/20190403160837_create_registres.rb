class CreateRegistres < ActiveRecord::Migration[5.2]
  def change
    create_table :registres do |t|
      t.references :nuance, foreign_key: true
      t.string :reg

      t.timestamps
    end
  end
end

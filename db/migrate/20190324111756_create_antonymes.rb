class CreateAntonymes < ActiveRecord::Migration[5.2]
  def change
    create_table :antonymes do |t|
      t.references :nuance, foreign_key: true
      t.string :antonym

      t.timestamps
    end
  end
end

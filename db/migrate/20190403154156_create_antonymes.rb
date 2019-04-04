class CreateAntonymes < ActiveRecord::Migration[5.2]
  def change
    create_table :antonymes do |t|
      t.references :nuances, foreign_key: true
      t.string :anto

      t.timestamps
    end
  end
end

class CreateSynonymes < ActiveRecord::Migration[5.2]
  def change
    create_table :synonymes do |t|
      t.references :nuances, foreign_key: true
      t.string :syno

      t.timestamps
    end
  end
end

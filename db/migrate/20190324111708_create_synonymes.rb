class CreateSynonymes < ActiveRecord::Migration[5.2]
  def change
    create_table :synonymes do |t|
      t.references :nuance
      t.string :synonyme
      t.timestamps
    end
  end
end

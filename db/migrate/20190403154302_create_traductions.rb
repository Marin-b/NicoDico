class CreateTraductions < ActiveRecord::Migration[5.2]
  def change
    create_table :traductions do |t|
      t.references :nuances, foreign_key: true
      t.string :trad

      t.timestamps
    end
  end
end

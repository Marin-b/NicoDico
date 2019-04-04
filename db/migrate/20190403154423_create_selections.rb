class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.references :nuances, foreign_key: true
      t.references :listes, foreign_key: true

      t.timestamps
    end
  end
end

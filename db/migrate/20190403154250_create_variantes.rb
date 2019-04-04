class CreateVariantes < ActiveRecord::Migration[5.2]
  def change
    create_table :variantes do |t|
      t.references :nuances, foreign_key: true
      t.string :var

      t.timestamps
    end
  end
end

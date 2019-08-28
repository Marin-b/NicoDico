class CreateNatures < ActiveRecord::Migration[5.2]
  def change
    create_table :natures do |t|
      t.references :dictionary, foreign_key: true
      t.string :nat

      t.timestamps
    end
  end
end

class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :author
      t.text :suggestion
      t.references :words, foreign_key: true

      t.timestamps
    end
  end
end

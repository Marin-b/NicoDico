class EditNatureDict < ActiveRecord::Migration[5.2]
  def change
    remove_column :natures, :dictionary_id
    add_column :natures, :lang, :string
  end
end

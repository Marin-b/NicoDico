class RenameDictReferenceinWord < ActiveRecord::Migration[5.2]
  def change
    rename_column :words, :dictionaries_id, :dictionary_id
  end
end

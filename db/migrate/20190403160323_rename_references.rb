class RenameReferences < ActiveRecord::Migration[5.2]
  def change
    rename_column :nuances, :words_id, :word_id
    rename_column :exemples, :nuances_id, :nuance_id
  end
end

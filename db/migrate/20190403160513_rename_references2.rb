class RenameReferences2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :antonymes, :nuances_id, :nuance_id
    rename_column :specials, :nuances_id, :nuance_id
    rename_column :synonymes, :nuances_id, :nuance_id
    rename_column :variantes, :nuances_id, :nuance_id
    rename_column :traductions, :nuances_id, :nuance_id
    rename_column :selections, :nuances_id, :nuance_id
    rename_column :selections, :listes_id, :liste_id
    rename_column :nuances, :users_id, :user_id

  end
end

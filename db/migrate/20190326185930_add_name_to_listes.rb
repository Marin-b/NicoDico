class AddNameToListes < ActiveRecord::Migration[5.2]
  def change
    add_column :listes, :name, :string
  end
end

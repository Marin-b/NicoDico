class AddUserReferencesToListes < ActiveRecord::Migration[5.2]
  def change
    add_reference :listes, :user
    add_foreign_key :listes, :users
  end
end

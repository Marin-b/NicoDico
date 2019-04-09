class AddfacebookImageTouser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_picutre_url
  end
end

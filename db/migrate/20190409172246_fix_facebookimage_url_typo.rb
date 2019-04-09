class FixFacebookimageUrlTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :facebook_picutre_url, :facebook_picture_url
  end
end

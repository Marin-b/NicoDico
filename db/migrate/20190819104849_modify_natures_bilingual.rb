class ModifyNaturesBilingual < ActiveRecord::Migration[5.2]
  def change
    add_column :natures, :nat_cb, :string
    rename_column :natures, :nat, :nat_fr
  end
end

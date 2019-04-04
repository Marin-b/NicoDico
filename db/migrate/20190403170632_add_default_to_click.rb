class AddDefaultToClick < ActiveRecord::Migration[5.2]
  def change
    change_column_default :words, :click, 0
  end
end

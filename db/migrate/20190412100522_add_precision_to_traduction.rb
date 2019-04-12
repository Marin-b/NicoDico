class AddPrecisionToTraduction < ActiveRecord::Migration[5.2]
  def change
    add_column :traductions, :precision, :string
  end
end

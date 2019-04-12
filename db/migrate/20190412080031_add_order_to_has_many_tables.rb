class AddOrderToHasManyTables < ActiveRecord::Migration[5.2]
  def change
    add_column :nuances, :order, :integer
    add_column :traductions, :order, :integer
    add_column :exemples, :order, :integer
    add_column :registres, :order, :integer
    add_column :specials, :order, :integer
    add_column :antonymes, :order, :integer
    add_column :synonymes, :order, :integer
    add_column :variantes, :order, :integer
  end
end

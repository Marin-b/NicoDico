class AddDefaultValueToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column_default :nuances, :order, 20
    change_column_default :traductions, :order, 20
    change_column_default :exemples, :order, 20
    change_column_default :registres, :order, 20
    change_column_default :specials, :order, 20
    change_column_default :antonymes, :order, 20
    change_column_default :synonymes, :order, 20
    change_column_default :variantes, :order, 20
  end
end

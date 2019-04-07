class AdddictReferenceInWord < ActiveRecord::Migration[5.2]
  def change
    remove_column :words, :dict
    add_reference :words, :dictionaries, foreign_key: true

  end
end

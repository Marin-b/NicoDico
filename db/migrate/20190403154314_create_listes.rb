class CreateListes < ActiveRecord::Migration[5.2]
  def change
    create_table :listes do |t|
      t.string :name

      t.timestamps
    end
  end
end

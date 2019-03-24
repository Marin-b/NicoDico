class CreateHanjas < ActiveRecord::Migration[5.2]
  def change
    create_table :hanjas do |t|
      t.references :nuance, foreign_key: true
      t.string :hanja

      t.timestamps
    end
  end
end

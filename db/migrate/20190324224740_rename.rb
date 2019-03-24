class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :kor_antonymes, :antonym, :antonyme
  end
end

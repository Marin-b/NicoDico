class RenameKoreanTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :exemples, :exemples_kor
    rename_table :nuances, :nuances_kor
    rename_table :synonymes, :synonymes_kor
    rename_table :words, :words_kor
    rename_table :antonymes, :antonymes_kor
  end
end

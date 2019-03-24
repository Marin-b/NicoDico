class PlurializeKoreanTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :exemples_kor, :kor_exemples
    rename_table :nuances_kor, :kor_nuances
    rename_table :synonymes_kor, :kor_synonymes
    rename_table :words_kor, :kor_words
    rename_table :antonymes_kor, :kor_antonymes
  end
end

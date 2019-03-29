class ChangeDefaultValueOfClickInKorWord < ActiveRecord::Migration[5.2]
  def change
    change_column_default :kor_words, :click, 0
  end
end

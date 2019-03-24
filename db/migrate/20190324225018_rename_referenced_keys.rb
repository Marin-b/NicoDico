class RenameReferencedKeys < ActiveRecord::Migration[5.2]
  def change
    rename_column :hanjas, :nuance_id, :kor_nuance_id
    rename_column :kor_exemples, :nuance_id, :kor_nuance_id
    rename_column :kor_synonymes, :nuance_id, :kor_nuance_id
    rename_column :kor_antonymes, :nuance_id, :kor_nuance_id
    rename_column :kor_nuances, :word_id, :kor_word_id
  end
end

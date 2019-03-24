class KorNuance < ApplicationRecord
  belongs_to :kor_word
  belongs_to :user
  has_many :kor_anotnymes, dependent: :destroy
  has_many :kor_exemples, dependent: :destroy
  has_many :kor_synonymes, dependent: :destroy
  has_many :hanjas, dependent: :destroy
end

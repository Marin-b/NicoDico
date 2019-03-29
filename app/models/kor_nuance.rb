class KorNuance < ApplicationRecord
  belongs_to :kor_word
  belongs_to :user
  has_many :kor_antonymes, dependent: :destroy
  has_many :kor_exemples, dependent: :destroy
  has_many :kor_synonymes, dependent: :destroy
  has_many :hanjas, dependent: :destroy
  accepts_nested_attributes_for :hanjas, allow_destroy: true
  accepts_nested_attributes_for :kor_exemples, allow_destroy: true
  accepts_nested_attributes_for :kor_synonymes, allow_destroy: true
  accepts_nested_attributes_for :kor_antonymes, allow_destroy: true
end

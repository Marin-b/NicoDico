class KorWord < ApplicationRecord
  has_many :kor_nuances, dependent: :destroy
  accepts_nested_attributes_for :kor_nuances, allow_destroy: true
end

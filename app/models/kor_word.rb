class KorWord < ApplicationRecord
  has_many :kor_nuances, dependent: :destroy
end

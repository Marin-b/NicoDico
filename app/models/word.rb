class Word < ApplicationRecord
  has_many :nuances, dependent: :destroy
  has_many :traductions, through: :nuances
  accepts_nested_attributes_for :nuances, allow_destroy: true
end

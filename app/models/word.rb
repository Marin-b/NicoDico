class Word < ApplicationRecord
  has_many :nuances, dependent: :destroy
  accepts_nested_attributes_for :nuances, allow_destroy: true
end

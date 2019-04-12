class Word < ApplicationRecord
  has_many :nuances, dependent: :destroy
  has_many :traductions, through: :nuances
  belongs_to :dictionary
  accepts_nested_attributes_for :nuances, allow_destroy: true

  validates :word, presence: true

  searchkick
end

class Liste < ApplicationRecord
  belongs_to :user
  has_many :selections
  validates :name, presence: true
end

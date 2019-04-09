class Liste < ApplicationRecord
  belongs_to :user
  has_many :selections, dependent: :destroy
  validates :name, presence: true
end

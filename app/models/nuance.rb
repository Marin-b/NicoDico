class Nuance < ApplicationRecord
  belongs_to :word
  belongs_to :user
  has_many :antonymes, dependent: :destroy
  has_many :exemples, dependent: :destroy
  has_many :synonymes, dependent: :destroy
  has_many :specials, dependent: :destroy
  has_many :registres, dependent: :destroy
  has_many :traductions, dependent: :destroy
  has_many :selections, dependent: :destroy
  has_many :variantes, dependent: :destroy
  accepts_nested_attributes_for :specials, allow_destroy: true
  accepts_nested_attributes_for :exemples, allow_destroy: true
  accepts_nested_attributes_for :synonymes, allow_destroy: true
  accepts_nested_attributes_for :antonymes, allow_destroy: true
  accepts_nested_attributes_for :registres, allow_destroy: true
  accepts_nested_attributes_for :traductions, allow_destroy: true
  accepts_nested_attributes_for :variantes, allow_destroy: true
end

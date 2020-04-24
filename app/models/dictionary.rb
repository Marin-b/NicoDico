class Dictionary < ApplicationRecord
  has_many :words
  has_many :nuances, through: :words
  has_many :exemples, through: :nuances
  def forvo_ini
    case lang
    when "japonais"
      return "ja"
    when 'coréen'
      return "ko"
    else
      return 'zh'
    end
  end
end

class Dictionary < ApplicationRecord
  has_many :words

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

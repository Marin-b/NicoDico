class Traduction < ApplicationRecord
  belongs_to :nuance

  searchkick
end

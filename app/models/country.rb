class Country < ApplicationRecord
  self.primary_key = :country_code

  has_many :cities, foreign_key: :country_code
  has_many :destinations
end

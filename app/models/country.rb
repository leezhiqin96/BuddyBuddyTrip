class Country < ApplicationRecord
  self.primary_key = :country_code

  has_many :cities
  has_many :destinations
end

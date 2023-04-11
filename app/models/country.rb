class Country < ApplicationRecord
  self.primary_key = :country_code

  has_many :cities
end

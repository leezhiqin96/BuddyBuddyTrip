class Country < ApplicationRecord
  self.primary_key = :country_code

  has_many :itinerary_countries, foreign_key: :country_code
  has_many :itineraries, through: :itinerary_countries

  has_many :destinations, foreign_key: :country_code

  include PgSearch::Model
  pg_search_scope :search_by_code_and_name,
                  against: %i[country_code name],
                  using: {
                    tsearch: { prefix: true }
                  }
end

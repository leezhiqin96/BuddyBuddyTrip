class ItineraryCountry < ApplicationRecord
  belongs_to :itinerary
  belongs_to :country, class_name: "Country", foreign_key: :country_code
end

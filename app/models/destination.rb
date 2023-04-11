class Destination < ApplicationRecord
  belongs_to :city
  has_many :storage_date_destinations

  has_many :itinerary_destinations
  has_many :itineraries, thorugh: :itinerary_destinations
end

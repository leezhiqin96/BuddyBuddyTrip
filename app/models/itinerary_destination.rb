class ItineraryDestination < ApplicationRecord
  belongs_to :destination
  belongs_to :itinerary
end

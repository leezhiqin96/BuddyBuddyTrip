class ItineraryStorageDate < ApplicationRecord
  belongs_to :itinerary
  belongs_to :storage_date
end

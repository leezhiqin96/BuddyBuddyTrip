class StorageDate < ApplicationRecord
  belongs_to :itinerary
  has_many :storage_date_destinations
  has_many :destinations, through: :storage_date_destinations
end

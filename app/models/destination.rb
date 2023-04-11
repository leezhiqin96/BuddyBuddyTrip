class Destination < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :city
  has_many :storage_date_destinations

  has_many :itinerary_destinations
  has_many :itineraries, thorugh: :itinerary_destinations

  validates :name, :address, presence: true
end

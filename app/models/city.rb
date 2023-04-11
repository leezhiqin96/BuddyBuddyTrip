class City < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :country
  has_many :destinations

  has_many :itinerary_cities
  has_many :itineraries, through: :itinerary_cities

  validates :name, :address, presence: true
end

class City < ApplicationRecord
  belongs_to :country, class_name: "Country", foreign_key: :country_code
  has_many :destinations

  has_many :itinerary_cities
  has_many :itineraries, through: :itinerary_cities

  validates :name, presence: true
end

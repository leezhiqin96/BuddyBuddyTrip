class Destination < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  #  It will only call geocode if the address attribute has been changed and will be saved in the database.

  belongs_to :country, class_name: "Country", foreign_key: :country_code

  has_many :storage_date_destinations
  has_many :storage_dates, through: :storage_date_destinations

  has_many :itinerary_destinations
  has_many :itineraries, thorugh: :itinerary_destinations

  validates :name, :address, presence: true
end

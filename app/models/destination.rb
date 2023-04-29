class Destination < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  #  It will only call geocode if the address attribute has been changed and will be saved in the database.

  belongs_to :country, class_name: "Country", foreign_key: :country_code

  has_many :storage_date_destinations, dependent: :destroy
  has_many :storage_dates, through: :storage_date_destinations

  has_many :itinerary_destinations, dependent: :destroy
  has_many :itineraries, through: :itinerary_destinations

  validates :name, :address, presence: true

  def assign_destination_to_country(coordinates)
    country = Country.find(Geocoder.search(coordinates).first.country_code.upcase)
    self.country = country
  end

  def assign_destination_to_date(storage_date_id)
    StorageDateDestination.create!(
      storage_date: StorageDate.find(storage_date_id),
      destination: self
    )
  end
end

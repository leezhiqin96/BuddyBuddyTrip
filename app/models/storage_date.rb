class StorageDate < ApplicationRecord
  belongs_to :itinerary
  has_many :storage_date_destinations, dependent: :destroy
  has_many :destinations, through: :storage_date_destinations

  validates :date, presence: true
end

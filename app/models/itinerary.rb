class Itinerary < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :collaborations
  has_many :users, through: :collaborations

  has_many :storage_dates

  has_many :itinerary_destinations
  has_many :destinations, thorugh: :itinerary_destinations

  has_many :itinerary_cities
  has_many :cities, through: :itinerary_cities

  has_many :expenses

  validates :name, :start_date, :end_date, presence: true
  validates :total_budget, numericality: { message: "Please provide numbers" }
end

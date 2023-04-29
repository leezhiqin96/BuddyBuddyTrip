class Itinerary < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  has_many :storage_dates, dependent: :destroy

  has_many :itinerary_destinations, dependent: :destroy
  has_many :destinations, through: :itinerary_destinations

  has_many :itinerary_countries, dependent: :destroy
  has_many :countries, through: :itinerary_countries

  has_many :expenses, dependent: :destroy

  validates :name, :start_date, :end_date, presence: true
  # validates :total_budget, numericality: { message: "Please provide numbers" }
  validates :end_date, comparison: { greater_than: :start_date }

  def store_dates
    days_apart = ((end_date - start_date) / 86_400).to_i
    (0..days_apart).each do |num|
      StorageDate.create!(
        date: start_date + num.days,
        itinerary: self
      )
    end
  end
end

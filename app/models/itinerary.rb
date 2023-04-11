class Itinerary < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :collaborations
  has_many :users, through: :collaborations

  has_many :storage_dates
end

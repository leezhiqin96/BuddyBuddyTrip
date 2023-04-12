class Expense < ApplicationRecord
  belongs_to :itinerary

  validates :name, :amount, :expense_type, presence: true
  validates :amount, numericality: true
  validates :expense_type, inclusion: {
    in: %w[flight lodging transport food attraction activity shopping groceries other]
  }
end

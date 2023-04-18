class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  validates :role, presence: true
  validates :role, inclusion: { in: %w[viewer editor] }
  validates :user_id, uniqueness: { scope: :itinerary_id }

  def editor?
    role == 'editor'
  end
end

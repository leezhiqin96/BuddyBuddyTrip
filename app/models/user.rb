class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :itineraries, through: :collaborations
  has_many :itineraries, foreign_key: :owner_id
  has_many :collaborations

  validates :first_name, :last_name, :email, :username, presence: true
  validates :email, :username, uniqueness: true
  # validates :username, length: { minimum: 3, too_short: '%<count> characters minimum for your username!' }
end

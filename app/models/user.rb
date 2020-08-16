class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_many :tours
  has_many :bokking_tours, through: :bookings, source: :tour
  has_many :bookings
end

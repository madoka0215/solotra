class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :tours
  has_many :considerations, dependent: :destroy
  has_many :consideration_tours, through: :considerations, source: :tour
  has_many :bookings, dependent: :destroy
  has_many :booking_tours, through: :bookings, source: :tour
  
  def consider(tour)
    self.considerations.find_or_create_by(tour_id: tour.id)
  end
  
  def notconsider(tour)
    consider = self.considerations.find_by(tour_id: tour.id)
    consider.destroy if consider
  end
  
  def consider?(tour)
    self.consideration_tours.include?(tour)
  end
end

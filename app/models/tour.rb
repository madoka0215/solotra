class Tour < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :tour_name, presence: true, length: { maximum: 50 }
  validates :image,
            :recommend_point,
            :schedule, presence: true
  validates :number_of_night,
            :length_of_stay, presence: true, length: { maximum: 2 }
  validates :departure,
            :arrival,
            :city, presence: true, length: { maximum: 15 }
  validates :base_price,
            :airplane_b_price,
            :airplane_c_price,
            :airplane_d_price,
            :hotel_b_price,
            :hotel_c_price,
            :hotel_d_price, presence: true, length: { maximum: 7 } 
  
  belongs_to :user, optional: true
  has_many :bookings
  has_many :users, through: :bookings
  has_many :considerations
  has_many :users, through: :considerations

  scope :get_by_departure, ->(departure) {
    where(departure: departure)
  }
  scope :get_by_arrival, ->(arrival) {
    where(arrival: arrival)
  }

  scope :get_by_days, ->(length_of_stay) {
    where(length_of_stay: length_of_stay)
  }
end
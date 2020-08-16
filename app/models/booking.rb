class Booking < ApplicationRecord

  validates :departure_date,
            :airplane_grade,
            :hotel_grade, presence: true
  validates :remarks_column, length: { maximum: 300 }
  
  belongs_to :user
  belongs_to :tour
end

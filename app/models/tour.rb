class Tour < ApplicationRecord
  class Tour < ActiveRecord::Base
    mount_uploader :image, ImageUploader
  end
  
  belongs_to :user, optional: true

  validates :tour_name, presence: true, length: { maximum: 50 }
  validates :image,
            :recommend_point,
            :schedule, presence: true
  validates :number_of_night,
            :length_of_stay, presence: true, length: { maximum: 2 }
  validates :departure,
            :arrival, presence: true, length: { maximum: 10 }
  validates :base_price,
            :airplane_b_price,
            :airplane_c_price,
            :airplane_d_price,
            :hotel_b_price,
            :hotel_c_price,
            :hotel_d_price, presence: true, length: { maximum: 7 }  

  def self.search(search)
      return Tour.all unless search
      Tour.where(['departure AND arrival AND length_of_stay ',"%#{search}%","%#{search}%","%#{search}%"])
  end
end
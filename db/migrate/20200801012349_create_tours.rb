class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :tour_name
      t.string :image
      t.string :number_of_night
      t.string :length_of_stay
      t.string :departure
      t.string :arrival
      t.string :city
      t.integer :base_price
      t.integer :airplane_b_price
      t.integer :airplane_c_price
      t.integer :airplane_d_price
      t.integer :hotel_b_price
      t.integer :hotel_c_price
      t.integer :hotel_d_price
      t.text :recommend_point
      t.text :schedule
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

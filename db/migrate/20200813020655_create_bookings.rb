class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :departure_date
      t.integer :airplane_grade
      t.integer :hotel_grade
      t.text :remarks_column
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end

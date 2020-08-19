class CreateConsiderations < ActiveRecord::Migration[6.0]
  def change
    create_table :considerations do |t|
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :tour_id], unique: true
    end
  end
end

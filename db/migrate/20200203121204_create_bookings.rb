class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end

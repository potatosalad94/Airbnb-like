class ChangeBookingNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:bookings, :status, true)
  end
end

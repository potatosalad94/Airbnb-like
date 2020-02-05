class ChangeBookingSatutus < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:bookings, :status, from: false, to: nil)
  end
end

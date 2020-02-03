class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :description
      t.string :city
      t.string :address
      t.integer :price_in_cents
      t.integer :max_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

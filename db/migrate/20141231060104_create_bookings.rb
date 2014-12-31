class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.datetime :date

      t.timestamps
    end
  end
end

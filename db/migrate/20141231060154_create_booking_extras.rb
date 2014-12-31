class CreateBookingExtras < ActiveRecord::Migration
  def change
    create_table :booking_extras do |t|
      t.references :extra, index: true
      t.references :booking, index: true

      t.timestamps
    end
  end
end

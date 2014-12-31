class AddBookingToPurchase < ActiveRecord::Migration
  def change
    add_reference :purchases, :booking, index: true
  end
end

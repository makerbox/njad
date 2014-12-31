class BookingExtra < ActiveRecord::Base
  belongs_to :extra
  belongs_to :booking
end

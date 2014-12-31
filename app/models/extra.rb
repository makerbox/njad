class Extra < ActiveRecord::Base
  	has_many :booking_extras
  	has_many :bookings, through: :booking_extras
  	  
  def to_label
  	"#{name} - $#{price} - #{description}"
  end

end

class AvailableDate < ActiveRecord::Base
	extend SimpleCalendar
  has_calendar :attribute => :avail
  belongs_to :product
end

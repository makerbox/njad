class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :booking_extras
  has_many :extras, through: :booking_extras
  has_one :purchase
  accepts_nested_attributes_for :booking_extras, allow_destroy: true
end

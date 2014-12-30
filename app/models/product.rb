class Product < ActiveRecord::Base
	resourcify

	has_many :available_dates
	has_many :product_extras
	has_many :extras, through: :product_extras
	accepts_nested_attributes_for :product_extras
	has_many :photos
	accepts_nested_attributes_for :photos, allow_destroy: true
	has_many :wish_products
	has_many :users, through: :wish_products
	has_many :reviews
	has_many :users, through: :reviews
	has_many :purchases
	has_many :users, through: :purchases

	def full_street_address
    	[street, suburb, city, state].compact.join(',')
	end

	geocoded_by :full_street_address
	after_validation :geocode
end

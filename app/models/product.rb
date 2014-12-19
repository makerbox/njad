class Product < ActiveRecord::Base
	has_many :available_dates
	has_many :product_extras
	has_many :extras, through: :product_extras
	has_many :photos
	has_many :wish_products
	has_many :users, through: :wish_products
	has_many :reviews
	has_many :users, through: :reviews
	has_many :purchases
	has_many :users, through: :purchases
end

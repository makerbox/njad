class Extra < ActiveRecord::Base
	has_many :product_extras
	has_many :products, through: :product_extras
end

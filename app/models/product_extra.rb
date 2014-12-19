class ProductExtra < ActiveRecord::Base
  belongs_to :product
  belongs_to :extra
end

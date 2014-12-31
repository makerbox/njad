class AddPurchaseToProductExtra < ActiveRecord::Migration
  def change
    add_reference :product_extras, :purchase, index: true
  end
end

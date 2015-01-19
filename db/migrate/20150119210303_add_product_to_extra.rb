class AddProductToExtra < ActiveRecord::Migration
  def change
    add_reference :extras, :product, index: true
  end
end

class CreateProductExtras < ActiveRecord::Migration
  def change
    create_table :product_extras do |t|
      t.references :product, index: true
      t.references :extra, index: true

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :capacity
      t.float :longitude
      t.float :latitude
      t.string :street
      t.string :suburb
      t.string :city
      t.string :state
      t.string :contact_name
      t.string :contact_number
      t.string :contact_email

      t.timestamps
    end
  end
end

class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end

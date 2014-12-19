class CreateAvailableDates < ActiveRecord::Migration
  def change
    create_table :available_dates do |t|
      t.datetime :avail
      t.references :product, index: true

      t.timestamps
    end
  end
end

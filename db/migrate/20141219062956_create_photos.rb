class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.references :product, index: true

      t.timestamps
    end
  end
end

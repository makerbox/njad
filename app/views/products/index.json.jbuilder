json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :capacity, :longitude, :latitude, :street, :suburb, :city, :state, :contact_name, :contact_number, :contact_email
  json.url product_url(product, format: :json)
end

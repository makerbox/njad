json.array!(@photos) do |photo|
  json.extract! photo, :id, :photo_url, :product_id
  json.url photo_url(photo, format: :json)
end

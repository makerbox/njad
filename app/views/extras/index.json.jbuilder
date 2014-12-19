json.array!(@extras) do |extra|
  json.extract! extra, :id, :name, :description, :price
  json.url extra_url(extra, format: :json)
end

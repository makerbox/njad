json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :user_id, :product_id, :date
  json.url purchase_url(purchase, format: :json)
end

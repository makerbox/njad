json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :product_id, :content, :rating
  json.url review_url(review, format: :json)
end

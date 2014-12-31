json.array!(@bookings) do |booking|
  json.extract! booking, :id, :user_id, :product_id, :date
  json.url booking_url(booking, format: :json)
end

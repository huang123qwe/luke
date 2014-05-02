json.array!(@orders) do |order|
  json.extract! order, :id, :contact_person, :email, :mobile, :pnumber, :check_in, :leave_away, :product_id
  json.url order_url(order, format: :json)
end

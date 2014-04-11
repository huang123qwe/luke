json.array!(@products) do |admin_product|
  json.extract! admin_product, :id, :title, :content
  json.url admin_product_url(admin_product, format: :json)
end

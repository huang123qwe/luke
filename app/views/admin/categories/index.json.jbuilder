json.array!(@categories) do |category|
  json.extract! category, :id, :tags
  json.url category_url(category, format: :json)
end

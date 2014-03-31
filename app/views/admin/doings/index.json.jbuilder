json.array!(@doings) do |doing|
  json.extract! doing, :id, :name, :cover
  json.url doing_url(doing, format: :json)
end

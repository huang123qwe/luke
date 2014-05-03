json.array!(@lamps) do |lamp|
  json.extract! lamp, :id, :name, :cover, :position
  json.url lamp_url(lamp, format: :json)
end

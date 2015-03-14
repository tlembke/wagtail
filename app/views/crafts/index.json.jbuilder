json.array!(@crafts) do |craft|
  json.extract! craft, :id, :name
  json.url craft_url(craft, format: :json)
end

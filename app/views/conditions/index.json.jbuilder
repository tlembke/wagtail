json.array!(@conditions) do |condition|
  json.extract! condition, :id, :name, :abbreviation
  json.url condition_url(condition, format: :json)
end

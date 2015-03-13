json.array!(@measures) do |measure|
  json.extract! measure, :id, :name, :abbreviation, :description, :units, :value, :operator, :places
  json.url measure_url(measure, format: :json)
end

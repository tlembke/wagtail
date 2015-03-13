json.array!(@measurevalues) do |measurevalue|
  json.extract! measurevalue, :id, :person_id, :measure_id, :value, :value_date, :created_by
  json.url measurevalue_url(measurevalue, format: :json)
end

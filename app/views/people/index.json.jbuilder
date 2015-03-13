json.array!(@people) do |person|
  json.extract! person, :id, :family_name, :given_names, :known_as, :address_line, :address_line_2, :town, :state, :postcode, :sex, :dob, :ihi, :dva, :phone, :created_by
  json.url person_url(person, format: :json)
end

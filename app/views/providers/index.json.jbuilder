json.array!(@providers) do |provider|
  json.extract! provider, :id, :family_name, :given_names, :organisation_id, :user_id
  json.url provider_url(provider, format: :json)
end

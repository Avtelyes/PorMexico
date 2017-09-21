json.extract! location, :id, :address, :latitude, :longitude, :state, :created_at, :updated_at
json.url location_url(location, format: :json)

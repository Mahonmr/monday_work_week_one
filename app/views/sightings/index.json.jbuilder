json.array!(@sightings) do |sighting|
  json.extract! sighting, :id, :species_id, :latitude, :longitude, :date_sighting
  json.url sighting_url(sighting, format: :json)
end

json.array!(@flights) do |flight|
  json.extract! flight, :id, :lat, :long, :altitude, :speed, :aircraft, :registration, :origin, :destination, :flightnum
  json.url flight_url(flight, format: :json)
end

class Flight
  include Mongoid::Document
  field :location, :type => Array
  index(
    {location: "2d"},{min: -200, max: 200}
  )
  field :flight_id, type: String
  field :altitude_ft, type: Integer
  field :speed_kts, type: Integer
  field :aircraft, type: String
  field :registration, type: String
  field :origin, type: String
  field :destination, type: String
  field :ICAOflightnum, type: String
  field :IATAflightnum, type: String
end

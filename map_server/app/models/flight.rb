class Flight
  include Mongoid::Document
  field :location, :type => Array
  index(
    {location: "2d"},{min: -200, max: 200, background: true}
  )
  field :altitude, type: Integer
  field :speed, type: Integer
  field :aircraft, type: String
  field :registration, type: String
  field :origin, type: String
  field :destination, type: String
  field :flightnum, type: String
  field :IATAflightnum, type: String
end

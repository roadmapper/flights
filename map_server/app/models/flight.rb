class Flight
  include Mongoid::Document
  field :lat, type: Float
  field :long, type: Float
  field :altitude, type: String
  field :speed, type: String
  field :aircraft, type: String
  field :registration, type: String
  field :origin, type: String
  field :destination, type: String
  field :flightnum, type: String
end

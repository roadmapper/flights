class Airport
  include Mongoid::Document
  field :icao_code, type: String
  field :iata_code, type: String
  field :name, type: String
end

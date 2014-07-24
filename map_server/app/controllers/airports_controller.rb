require "open-uri"
require "csv"

class AirportsController < ApplicationController
  def load
    url = "https://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airports.dat?format=raw"
    url_data = open(url).read()
    csv = CSV.parse(csv_text, :headers => false)
    csv.each do |row|
      Airport.create!(row.to_hash)
    end
  end

end

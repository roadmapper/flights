require 'open-uri'
require 'json/pure'
require 'mongo'
#require 'bson_ext'

include Mongo

client = MongoClient.new("localhost", 27017)
db = client['map_server_development']
collection = db['planes']

data = open("http://db8.flightradar24.com/zones/full_all.json").read
data = JSON.parse(data)

data.each do |d|
	hash = {:hex => d[1][0], :lat => d[1][1], :long => d[1][2], :aircraft_track => d[1][3], :altitude_ft => d[1][4], :speed_kts => d[1][5], 
		:squawk => d[1][6], :radar => d[1][7], :aircraft => d[1][8], :registration => d[1][9], :timestamp => d[1][10], :origin => d[1][11], 
		:destination => d[1][12], :IATAflightnum => d[1][13], :ICAOflightnum => d[1][16]}
	# jsonified = hash.to_json
	#p hash
	id = collection.insert(hash)
	#p id
end

p "There are #{collection.count} planes"




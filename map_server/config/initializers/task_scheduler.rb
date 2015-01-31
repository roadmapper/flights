# file:
# config/initializers/scheduler.rb

#require 'rufus-scheduler'
require 'open-uri'
# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.new


# Recurrent task...
#
s.every('1m') do
  session = Moped::Session.new([ "127.0.0.1:27017" ])
  db = "map_server_development"
  session.use db
  collection = session[:flights]
  collection.find.remove_all
  #OLD JSON source, does not give all information now
  #data = open("http://db8.flightradar24.com/zones/full_all.json").read
  data = open("http://arn.data.fr24.com/zones/fcgi/feed.json").read
  data = JSON.parse(data)

  data.each do |d|
    hash = {:flight_id => d[0], :hex => d[1][0], :location => [d[1][1], d[1][2]], :aircraft_track => d[1][3], :altitude_ft => d[1][4], :speed_kts => d[1][5],
            :squawk => d[1][6], :radar => d[1][7], :aircraft => d[1][8], :registration => d[1][9], :timestamp => d[1][10], :origin => d[1][11],
	    :destination => d[1][12], :IATAflightnum => d[1][13], :ICAOflightnum => d[1][16]}
    collection.insert(hash)
  end

  p "There are #{collection.find.count} planes"
end


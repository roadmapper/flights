#!/bin/sh
DB="map_server_development"
mongo $DB --eval "printjson(db.flights.remove({})) " >> /tmp/updatedb.log
/home/vinay/.rbenv/shims/ruby /home/vinay/flights/flights.rb $DB >> /tmp/updatedb.log
echo "Testing"
echo "Loaded flights at: $(date)" >> /tmp/myflights.log

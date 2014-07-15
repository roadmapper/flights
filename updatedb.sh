#!/bin/sh
DB="map_server_development"
mongo $DB --eval "printjson(db.flights.remove({}))"
ruby flights.rb $DB
echo "Loaded flights at: $(date)" >> /tmp/myflights.log

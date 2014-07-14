#!/bin/sh
DB="map_server_development"
mongo $DB --eval "printjson(db.planes.drop())"
ruby flights.rb $DB
echo "Loaded flights at: $(date)" >> /tmp/myflights.log

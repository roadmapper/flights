#!/bin/sh
DB="map_server_development"
mongo $DB --eval "printjson(db.flights.remove({})) " >> /tmp/updatedb.log
ruby flights.rb $DB >> /tmp/updatedb.log
echo "Loaded flights at: $(date)" >> /tmp/myflights.log

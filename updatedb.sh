#!/bin/sh
mongo example-db --eval "printjson(db.planes.drop())"
ruby flights.rb
echo "Loaded flights at: $(date)" >> /tmp/myflights.log

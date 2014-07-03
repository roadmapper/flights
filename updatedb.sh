#!/bin/sh
mongo example-db --eval "printjson(db.planes.drop())"
ruby flights.rb

flights
=======

Working on a flight endpoint in Rails...

Deployment notes (Ubuntu 14.04):
Uses Ruby 2.0.0p481 (rbenv instead of rvm), Rails 4.1.2, MongoDB 2.6

When deploying:
 - need to add Whenever jobs to crontab (<code>bundle exec whenever --update-crontab map_server</code>)
 - create indexes for geo based queries (<code>rake db:mongoid:create_indexes</code>)

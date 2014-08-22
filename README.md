flights
=======

Working on a flight endpoint in Rails...

Deployment notes (Ubuntu 14.04):
Uses Ruby 2.0.0p481 (rbenv instead of rvm), Rails 4.1.2, MongoDB 2.6

When deploying:
 - need to add Whenever jobs to crontab (`bundle exec whenever --update-crontab map_server`)
 - create indexes for geo based queries (`rake db:mongoid:create_indexes`)

Ruby/Rails Installation
```bash
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.2
rbenv global 2.1.2
ruby -v
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

gem install rails

rbenv rehash

rails -v
```
Install mongo gem 1.8.3 for the flights.rb to work properly, may need to move the scraping/rehashing JSON logic into a Rails service for the future.

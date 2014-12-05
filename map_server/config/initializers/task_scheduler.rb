# file:
# config/initializers/scheduler.rb

#require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.new


# Stupid recurrent task...
#
s.every('2m') do
  puts 'hi from rufus'
end

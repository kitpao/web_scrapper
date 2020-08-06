#!/usr/bin/env ruby

# frozen_string_literal: true

require 'timeout'
require_relative '../lib/extra_methods'
require_relative '../lib/program_methods'


program = Program.new()

# welcome and setup
puts "This is a modification to check for updates"
puts "_______________________________________________________________"

puts "NOTE: to end the program just press ctrl + c and close the window"
sleep(1)
puts "Processing..."
# puts "I WANNA SLEEP ACTIVATED at #{Time.now}, finishing sleep time at #{Time.now + 2205}"
# sleep(2205)
page = program.start
repeated = 0
while true
  repeated = program.update(page, repeated)
  puts "program checked at #{Time.now}"
  #total = 30 + rand(1..60)
  total = rand(1..5)
  puts "waiting #{total} seconds for new results"
  sleep(total)
=begin
  print "[0%_"
  sleep(total/10)
  print "_10%_"
  sleep(total/10)
  print "_20%_"
  sleep(total/10)
  print "_30%_"
  sleep(total/10)
  print "_40%_"
  sleep(total/10)
  print "_50%_"
  sleep(total/10)
  print "_60%_"
  sleep(total/10)
  print "_70%_"
  sleep(total/10)
  print "_80%_"
  sleep(total/10)
  print "_90%_"
  sleep(total/10)
  print "_100%]"
  puts ""
=end
end

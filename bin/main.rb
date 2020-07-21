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
page = program.start
while true
  result = program.update(page)
  total = 120
  puts result
  puts "waiting one minute for new results"
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
  sleep(total/10 + rand(1..5))
  print "_100%]"
  puts ""
end

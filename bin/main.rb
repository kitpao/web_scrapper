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
  puts result
  puts "waiting one minute for new results"
  print "[0%_"
  sleep(6)
  print "_10%_"
  sleep(6)
  print "_20%_"
  sleep(6)
  print "_30%_"
  sleep(6)
  print "_40%_"
  sleep(6)
  print "_50%_"
  sleep(6)
  print "_60%_"
  sleep(6)
  print "_70%_"
  sleep(6)
  print "_80%_"
  sleep(6)
  print "_90%_"
  sleep(rand(6..60))
  print "_100%]"
  puts ""
end

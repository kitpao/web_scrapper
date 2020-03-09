#!/usr/bin/env ruby

# frozen_string_literal: true

require 'timeout'
require_relative '../lib/extra_methods'
require_relative '../lib/program_methods'


program = Program.new()

# welcome and setup
puts "Welcome! This program will inform you when the exchange rate between Mexican pesos and Dollars are at the best! it will check every hour"
puts "_______________________________________________________________"
sleep (1)
puts ""
check_urgency = true
while check_urgency
  puts "Please type a number and press enter to see how fast would you like to exchange your money:"
  puts "1 - Very fast - Quicker notifications but more volatile since it only takes the rates from the last 4 days"
  puts "2 - Fast - Quick notifications and less volatile since it is based on the last 7 days"
  puts "3 - Normal - Slow notifications but stable since it is based on the last 2 weeks"
  puts "4 - Long run - Slower notifications but the most reliable, since it takes the data from the last 30 days"
  puts ""
  print "Your answer: "
  begin
    input = gets.chomp.match("^[1-4]$").string
  rescue
    puts "REMEMBER TO type a number from 1 to 4"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    sleep(1.2)
  else
    day_limit = choose_days(input, 0)
    check_urgency = false
  end
end

puts "NOTE: to end the program just press ctrl + c and close the window"
sleep(1)
puts "Processing..."

while true
  program.run_program(day_limit)
  puts "If you would like to change how fast you get positive notifications, please type the new number in the next 20 seconds (1 - Very fast, 2 - Fast, 3 - Normal, 4 - Long run), if not, it will continue working as normal"

  begin
    user_answer = Timeout::timeout(20) do
      gets.chomp
    end
  rescue Timeout::Error
    puts "No new answer..."
  else
    day_limit = choose_days(user_answer, day_limit)
    if user_answer.to_i >= 1 && user_answer.to_i <= 4
      puts "New parameter received: " + user_answer
      input = user_answer
    else
      puts "Invalid answer, using previous value #{input}"
    end
  end
  puts "waiting one hour for new results"
  print "[0%_"
  sleep(358)
  print "_10%_"
  sleep(358)
  print "_20%_"
  sleep(358)
  print "_30%_"
  sleep(358)
  print "_40%_"
  sleep(358)
  print "_50%_"
  sleep(358)
  print "_60%_"
  sleep(358)
  print "_70%_"
  sleep(358)
  print "_80%_"
  sleep(358)
  print "_90%_"
  sleep(358)
  print "_100%]"
  puts ""
end

#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'date'
require 'timeout'

def scraper(day_limit)

  stats = []
  day_counter = 0
  @day_limit = day_limit

  while day_counter < day_limit
    #get day for URLs
    date_string = Date.today-day_counter
    #convert
    formated_date = date_string.to_s.match /(\d+)-(\d+)-(\d+)/
    ready_date = formated_date[1]+formated_date[2]+formated_date[3]

    day_counter += 1

    #specify route
    url = 'https://www.eldolar.info/es-MX/mexico/dia/' + ready_date
    unparsed = HTTParty.get(url)
    parsed = Nokogiri::HTML(unparsed)


    #retrieve data
    this_day = []
    best_to_sell = parsed.css('[title="Mejor compra"]').text.to_f
    best_to_buy = parsed.css('[title="Mejor venta"]').text.to_f
    average = parsed.css('td.num.xTimes').text.to_f
    this_day[0] = best_to_sell
    this_day[1] = best_to_buy
    this_day[2] = average
    stats << this_day
  end

  notify = 0
  #comparison to sell
  max_sell = stats[0][0]
  (day_limit-1).times do |i|
    max_sell = stats[i][0] if max_sell < stats[i][0]
  end

  if max_sell == stats[0][0] && max_sell > stats [0][2]
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "The price right now is the HIGHEST in the last #{day_limit} days! you should SELL right now at $#{max_sell} pesos per dollar, check the best place to sell in the fist column of this webpage: https://www.eldolar.info/es-MX/mexico/dia/hoy"
    notify = 1
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  end

  #comparison to buy
  min_buy = stats[0][1]
  (day_limit-1).times do |i|
    min_buy = stats[i][1] if min_buy > stats[i][1]
  end

  if min_buy == stats[0][1] && min_buy < stats [0][2]
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts "The price right now is the LOWEST in the last #{day_limit} days! you should BUY right now at $#{min_buy} pesos per dollar, check the best place to buy in the second column of this webpage: https://www.eldolar.info/es-MX/mexico/dia/hoy"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    notify = 1
  end

  if notify == 0
    time = Time.new
    puts "There are no news now at " + time.inspect + ". Comparing against the data of the last #{day_limit} days"
  end
  #result
  stats

end

puts "Welcome! This program will inform you when the exchange rate between Mexican pesos and Dollars are at the best! it will check every hour"
check_urgency = true

while check_urgency
  puts "Please type a number and press enter to see how fast would you like to exchange your money:"
  puts "1 - Very fast - Quicker notifications but more volatile since it only takes the rates from the last 4 days"
  puts "2 - Fast - Quick notifications and less volatile since it is based on the last 7 days"
  puts "3 - Normal - Slow notifications but stable since it is based on the last 2 weeks"
  puts "4 - Long run - Slower notifications but the most reliable, since it takes the data from the last 30 days"
  begin
    input = gets.chomp.match("[1-4]").string
  rescue
    puts "REMEMBER TO type a number from 1 to 4"
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    sleep(1.2)
  else
    input = input.to_i
    day_limit = 4 if input == 1
    day_limit = 7 if input == 2
    day_limit = 14 if input == 3
    day_limit = 30 if input == 4
    check_urgency = false
  end
end

puts "Note: to end the program just press ctrl + c and close the window"

while true
  scraper(day_limit) #program.scrape
  puts "If you would like to change how fast you get positive notifications, please type the new number in the next 10 seconds (1 - Very fast, 2 - Fast, 3 - Normal, 4 - Long run), if not, it will continue working as normal"

  begin
    user_answer = Timeout::timeout(10) do
      gets.chomp
    end
  rescue Timeout::Error
    puts "No new answer..."
  else
    input = user_answer.to_i
    day_limit = 4 if input == 1
    day_limit = 7 if input == 2
    day_limit = 14 if input == 3
    day_limit = 30 if input == 4
    puts "New parameter received: " + user_answer
  end
  puts "waiting one hour for new results"
  print "[0%_"
  sleep(360)
  print "_10%_"
  sleep(360)
  print "_20%_"
  sleep(360)
  print "_30%_"
  sleep(360)
  print "_40%_"
  sleep(360)
  print "_50%_"
  sleep(360)
  print "_60%_"
  sleep(360)
  print "_70%_"
  sleep(360)
  print "_80%_"
  sleep(360)
  print "_90%_"
  sleep(360)
  print "_100%]"
  puts ""
end

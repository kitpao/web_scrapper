#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'date'

puts "Welcome! This program will inform you when the exchange rate between Mexican pesos and Dollars are at the best rate!"
check_urgency = true
while check_urgency
  puts "Please type a number and press enter to see how fast would you like to exchange your money:"
  puts "1 - Very fast - Will notify you at the first good news there are, based on the trend from the last 4 days"
  puts "2 - Fast - Will notify you when the trending is nice based on the last 7 days"
  puts "3 - Normal - Will notify you when the trending has been stable for the last 2 weeks"
  puts "4 - Whenever it's stable - Will notify you when the trending has been stable for the last month"
  begin
    input = gets.chomp.match("[1-4]").string
  rescue
    puts "REMEMBER TO type a number from 1 to 4"
    puts "_____________________________________"
    sleep(1.2)
  else
    puts "all okay"
    check_urgency = false
  end
end

def scraper
  stats = []
  day_counter = 0
  day_limit = 5 # change value accordingly


  while day_counter < day_limit
    #get day for URLs
    date_string = Date.today-day_counter
    #convert
    formated_date = date_string.to_s.match /(\d+)-(\d+)-(\d+)/
    ready_date = formated_date[1]+formated_date[2]+formated_date[3]

    day_counter += 1

    #specify route
    url_base = 'https://www.eldolar.info/es-MX/mexico/dia/' + ready_date
    full_url = url_base # + url_complement
    unparsed = HTTParty.get(full_url)
    parsed = Nokogiri::HTML(unparsed)


    #retrieve data
    today = {}
    best_to_sell = parsed.css('[title="Mejor compra"]').text.to_f
    best_to_buy = parsed.css('[title="Mejor venta"]').text.to_f
    average = parsed.css('td.num.xTimes').text.to_f
    today[:sell] = best_to_sell
    today[:buy] = best_to_buy
    today[:av] = average
    stats << today

  end
  byebug
end

scraper

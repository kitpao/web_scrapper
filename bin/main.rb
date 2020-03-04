#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'date'



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

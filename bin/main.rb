#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  #get data from various days (4)
    #get specific data, 3 elements
  url = 'https://www.eldolar.info/es-MX/mexico/dia/hoy'
  unparsed = HTTParty.get(url)
  parsed = Nokogiri::HTML(unparsed)
  today = {}
  best_to_sell = parsed.css('[title="Mejor compra"]').text.to_f
  best_to_buy = parsed.css('[title="Mejor venta"]').text.to_f
  average = parsed.css('td.num.xTimes').text.to_f
  today[:sell] = best_to_sell
  today[:buy] = best_to_buy
  today[:av] = average
  byebug
end

scraper

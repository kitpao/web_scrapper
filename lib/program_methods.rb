# frozen_string_literal: true

# This requires were necessary in this file so the tests could execute
require 'date'
require 'nokogiri'
require 'httparty'

class Program
  attr_reader :day_limit
  def initialize
    @day_limit = day_limit
  end

  def run_program(day_limit)
    stats = scraper(day_limit)
    notify_results(stats, day_limit)
  end

  private

  def scraper(day_limit, day_counter = 0)
    stats = []
    while day_counter < day_limit
      # get day for URLs
      date_string = Date.today - day_counter
      # format day for url
      formated_date = date_string.to_s.match(/(\d+)-(\d+)-(\d+)/)
      ready_date = formated_date[1] + formated_date[2] + formated_date[3]
      day_counter += 1
      # specify route
      url = 'https://www.eldolar.info/es-MX/mexico/dia/' + ready_date
      unparsed = HTTParty.get(url)
      parsed = Nokogiri::HTML(unparsed.body)
      # retrieve data
      this_day = []
      best_to_sell = parsed.css('[title="Mejor compra"]').text.to_f
      best_to_buy = parsed.css('[title="Mejor venta"]').text.to_f
      average = parsed.css('td.num.xTimes').text.to_f
      return scraper(day_limit + 1, 1) if best_to_sell == 0.0 && best_to_buy == 0.0

      this_day[0] = best_to_sell
      this_day[1] = best_to_buy
      this_day[2] = average
      stats << this_day
    end
    stats
  end

  def notify_results(stats, day_limit)
    notify = 0
    max_sell = search_highest(stats, day_limit)
    min_buy = search_lowest(stats, day_limit)

    if max_sell == stats[0][0] && max_sell > stats[0][2]
      puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
      puts "The price right now is the HIGHEST in the last #{day_limit} days!"
      puts "you should SELL right now at $#{max_sell} pesos per dollar,"
      puts 'check the best place to sell in the fist column of this webpage: https://www.eldolar.info/es-MX/mexico/dia/hoy'
      notify = 1
      puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    end

    if min_buy == stats[0][1] && min_buy < stats[0][2]
      puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
      puts "The price right now is the LOWEST in the last #{day_limit} days!"
      puts "you should BUY right now at $#{min_buy} pesos per dollar,"
      puts 'check the best place to buy in the second column of this webpage: https://www.eldolar.info/es-MX/mexico/dia/hoy'
      puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
      notify = 1
    end

    if notify.zero?
      time = Time.new
      puts '-----There are no news now at ' + time.inspect + " comparing against the data of the last #{day_limit} days"
      puts "Current dollar price for selling: #{stats[0][0]}, highest is #{max_sell}"
      puts "Current dollar price for buying: #{stats[0][1]}, lowest is #{min_buy}"
      puts "Average price: #{stats[0][2]}"
    end
    notify
  end

  def search_highest(stats, day_limit)
    # comparison to sell
    max_sell = stats[0][0]
    (day_limit - 1).times do |i|
      max_sell = stats[i][0] if max_sell < stats[i][0]
    end
    max_sell
  end

  def search_lowest(stats, day_limit)
    # comparison to buy
    min_buy = stats[0][1]
    (day_limit - 1).times do |i|
      min_buy = stats[i][1] if min_buy > stats[i][1]
    end
    min_buy
  end
end

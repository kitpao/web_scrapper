# frozen_string_literal: true

# This requires were necessary in this file so the tests could execute
#dir = File.dirname(File.expand_path(__FILE__))
#$LOAD_PATH.unshift dir + "/../lib"
require 'date'
require 'nokogiri'
require 'httparty'
require 'mechanize'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'byebug'
#require "alsa-rawmidi"
#brew install mpg123
#mpg123 alarm.wav


Capybara.default_driver = :poltergeist
Capybara.run_server = false

class Program
  include Capybara::DSL

  attr_reader :day_limit
  def initialize
    @day_limit = day_limit
  end

  def start()
    page = log_in_with_me()
  end

  def update(login)
    update = update_page(login)
  end

  private

  def log_in_with_me
    # log in
    url = 'https://dashboard.microverse.org/auth/auth0'
    visit(url)
    puts "I am filling the form"
    fill_in '1-email', with: File.read('user.rb')
    sleep(2)
    puts "done submitting username"
    fill_in 'password', with: File.read('password.rb')
    sleep(2)
    puts "done submitting password"
    click_link_or_button 'submit'
    sleep(5)
    puts "done submitting form"
    return page
  end

  def update_page(page)
    begin
      page.click_on 'Code Review Requests'
    rescue
      sleep(2)
      page.current_path
    else
      puts "no error handling"
    ensure
      page.current_path
    end
    puts "done with first error handling"
    begin
      page.click_on 'Code Review Requests'
    rescue
      sleep(2)
      page.current_path
    else
      puts "no error handling"
    ensure
      page.current_path
    end
    puts "you are in this link:"
    puts page.current_path
    puts "successfull link to code review"
    if page.has_css? '.review-request-table-link'
      puts "YOU FOUND THE LINK!!!!!!!!!!!!"
      #system 'aplay Alarm.wav'
    end

    if page.has_css? '.review-request-button'
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FOUND!<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      show_wolf()
      system 'aplay Alarm.wav'
      system 'aplay Alarm.wav'

    else
      puts "-----------------------------NOTHING FOR NOW---------------------------------------"
    end

    return page.has_css? '.review-request-button'
  end

  def show_wolf
    puts "                              __"
    puts "                            .d$$b"
    puts "'                         .' TO$;|"
    puts "                         /  : TP._;"
    puts "                        / _.;  :Tb|'"
    puts "                       /   /   ;j$j"
    puts "                   _.-'       d$$$$"
    puts "                 .' ..        d$$$$;"
    puts "'               /  /P'      d$$$$P. ||"
    puts "'/             /   '      .d$$$P' |\^'l"
    puts "'            .'           `T$P^'''''  :"
    puts "         ._.'      _.'                ;"
    puts "      `-.-'.-'-' ._.       _.-'    .-'"
    puts "    `.-' _____  ._              .-'"
    puts "   -(.g$$$$$$$b.              .'"
    puts "     ''^^T$$$P^)            .(:"
    puts "       _/  -'  /.'         /:/;"
    puts "    ._.'-'`-'  ')/         /;/;"
    puts " `-.-'..--''   ' /         /  ;"
    puts ".-' ..--''        -'          :"
    puts "..--'--.-'         (\     .-(\'"
    puts "  '..--'              `-\(\/;`"
    puts "    _.                      :"
    puts "                            ;`-"
    puts "                           :`"
    puts "                           ; "
  end
end

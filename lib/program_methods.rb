# frozen_string_literal: true

# This requires were necessary in this file so the tests could execute
#dir = File.dirname(File.expand_path(__FILE__))
#$LOAD_PATH.unshift dir + "/../lib"
require 'date'
#require 'nokogiri'
#require 'httparty'
#require 'mechanize'
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

  def update(login, repeated)
    update = update_page(login, repeated)
  end

  private

  def log_in_with_me
    # log in
	puts "loging in"
    url = 'https://dashboard.microverse.org/auth/auth0'
    visit(url)
puts "loging in"
    puts "I am filling the form"
    fill_in '1-email', with: File.read('user.rb')
    puts "done submitting username"
    fill_in 'password', with: File.read('password.rb')
    puts "done submitting password"
    click_link_or_button 'submit'
    sleep(5)
    puts "done submitting form"
    return page
  end

  def update_page(page, repeated)
    begin
      click_on 'Code Review Requests'
    rescue
      sleep(2)
      click_on 'Code Review Requests'
    end
    x = page.current_path
    if x == '/code_review_requests'
      puts "successfull link to #{x}"
    else
      puts "WARNING: you are in #{x}"
    end
    
    if page.has_css? '.review-request-table-link'
      puts "Found items on the correct page!!!!!!!!!!!!"
      #system 'aplay Alarm.wav'
    end

    # -------------SELECTION OF ANSWERS AND ALARMS-------------------
    if page.has_css? '.review-request-button'
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FOUND!<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
=begin
      if page.has_selector? '.review-request-button', text: 'Claim'
        if page.has_selector? '.mb-1 .review-request-iteration-badge', text: 'Re-review'
          repeated += 1
          puts "This is a re-review, check manually"
        else
          #page.click_on 'Claim'
	  repeated = 0
          puts "I TOOK A FIRST REVIEW :D"
          system 'aplay Alarm.wav'
        end
=end
#=begin
      if page.has_selector? '.review-request-button', text: 'Claim'
        if page.has_selector? '.review-request-project-name', text: 'Bootstrap'
          repeated += 1
          puts "IT IS BOOTSTRAP D:"
        elsif page.has_selector? '.review-request-project-name', text: 'Responsive'
          repeated += 1
          puts "IT IS NEWSWEEK D:"
	elsif page.has_selector? '.review-request-project-name', text: 'Enumerable'
          repeated += 1
          puts "IT IS ENUMERABLE D:"
	elsif page.has_selector? '.review-request-project-name', text: 'logic'
          repeated += 1
          puts "IT IS game logic of OOP D:"
	elsif page.has_selector? '.mb-1 .review-request-iteration-badge', text: 'Re-review'
          repeated += 1
          puts "This is a re-review, check manually"
        else
          #page.click_on 'Claim'
	  repeated = 0
          puts "I took the project :D"
	  system 'aplay Alarm.wav'
	end
#=end
      else
        puts "Check, I already took the project before!!!!!!"
        repeated = 0
      end
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FOUND!<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      show_wolf()
      if repeated <= 2
        system 'aplay Alarm.wav'
        system 'aplay Alarm.wav'
      end
    else
      puts "-----------------------------NOTHING FOR NOW---------------------------------------"
    end
    repeated
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

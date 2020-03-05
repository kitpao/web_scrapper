# frozen_string_literal: true

require './lib/extra_methods.rb'
require './lib/program_methods.rb'

RSpec.describe 'Web Scraper for Money exchange' do

  describe '#choose_days' do
    it 'when there is no valid input' do
      input = 'q'
      day_limit = 4
      expect(choose_days(input, day_limit)).to eql(day_limit)
    end

    it 'when there is valid input' do
      input = '4'
      day_limit = 0
      expect(choose_days(input, day_limit)).to eql(30)
    end
  end

  describe '#run_program' do
    test_program = Program.new()

    it 'when the limit is low' do
      day_limit = 4
      expect(test_program.run_program(day_limit)).to be <= 1
    end

    it 'when the limit is high' do
      day_limit = 30
      expect(test_program.run_program(day_limit)).to be <= 1
    end
  end
end

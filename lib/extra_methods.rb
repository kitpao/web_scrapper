# frozen_string_literal: true

def choose_days(input, day_limit)
  input = input.to_i
  day_limit = 4 if input == 1
  day_limit = 7 if input == 2
  day_limit = 14 if input == 3
  day_limit = 30 if input == 4
  day_limit
end

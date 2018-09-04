# frozen_string_literal: true

class DiceInteractor
  class << self
    def roll(count:, sides:, constant:)
      raise ArgumentError, 'Invalid Roll Input' unless input_valid?(count, sides, constant)

      response = HTTParty.get(dice_service_url(count, sides, constant))
      response[:total]
    end

    private

    def input_valid?(count, sides, constant)
      count.between?(1, 100) &&
        constant.between?(-1_000_000, 1_000_000) &&
        valid_sides.include?(sides)
    end

    def valid_sides
      [4, 6, 8, 10, 12, 20, 100]
    end

    def dice_service_url(count, sides, constant)
      "http://dice/roll?count=#{count}&sides=#{sides}&constant=#{constant}"
    end
  end
end

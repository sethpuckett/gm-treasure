# frozen_string_literal: true

class DiceInteractor
  include HTTParty

  class << self
    def roll(count:, sides:, constant:)
      raise ArgumentError, 'Invalid Roll Input' unless input_valid?(count, sides, constant)

      response = HTTParty.get(dice_service_url(count, sides, constant), format: :plain)
      json_response = JSON.parse(response, symbolize_names: true)
      json_response[:total]
    end

    private

    def input_valid?(count, sides, constant)
      count.between?(1, 100) &&
        constant.between?(-1_000_000, 1_000_000) &&
        Constant::valid_dice_sides?(sides)
    end

    def dice_service_url(count, sides, constant)
      "http://dice:3000/dice/roll?count=#{count}&sides=#{sides}&constant=#{constant}"
    end
  end
end

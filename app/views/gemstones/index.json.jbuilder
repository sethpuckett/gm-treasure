# frozen_string_literal: true

json.gems @response[:gems], partial: 'gemstones/gemstone', as: :gem
json.total_cost_in_gp @response[:total_cost_in_gp]

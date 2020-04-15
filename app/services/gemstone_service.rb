# frozen_string_literal: true

class GemstoneService
  class ValidationError < StandardError; end

  GEM_VALUES = [5000, 1000, 500, 100, 50, 10].freeze

  class << self
    def generate(value:, single: false)
      validate_value(value)
      gems = build_gem_set(value, single)
      {
        gems: gems,
        total_cost_in_gp: gems.sum(&:cost_in_gp)
      }
    rescue ValidationError => e
      { error: e }
    end

    def validate_value(value)
      return unless value < 10 || value > 10_000_000

      raise ValidationError, "Value must be >= 10 and <= 10,000,000; received #{value}"
    end

    def build_gem_set(value, single)
      gems = []
      gems.push(random_gem(value))
      return gems if single

      value -= gems.first.cost_in_gp
      while value >= GEM_VALUES.last
        new_gem = random_gem(value)
        value -= new_gem.cost_in_gp
        gems.push(new_gem)
      end

      gems
    end

    def random_gem(max_value)
      value = GEM_VALUES.find { |v| v <= max_value }
      potential_gems = Gemstone.where(cost_in_gp: value)
      roll = DiceInteractor.roll(sides: potential_gems.count)
      potential_gems.offset(roll - 1).first
    end
  end
end

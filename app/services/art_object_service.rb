# frozen_string_literal: true

class ArtObjectService
  class ValidationError < StandardError; end

  ART_OBJECT_VALUES = [7500, 2500, 750, 250, 25].freeze

  class << self
    def generate(value:, single: false)
      validate_value(value)
      art_objects = build_art_object_set(value, single)
      {
        art_objects: art_objects,
        total_cost_in_gp: art_objects.sum(&:cost_in_gp)
      }
    rescue ValidationError => e
      { error: e }
    end

    def validate_value(value)
      return unless value < 25 || value > 10_000_000

      raise ValidationError, "Value must be >= 25 and <= 10,000,000; received #{value}"
    end

    def build_art_object_set(value, single)
      art_objects = []
      art_objects.push(random_art_object(value))
      return art_objects if single

      value -= art_objects.first.cost_in_gp
      while value >= ART_OBJECT_VALUES.last
        new_art_object = random_art_object(value)
        value -= new_art_object.cost_in_gp
        art_objects.push(new_art_object)
      end

      art_objects
    end

    def random_art_object(max_value)
      value = ART_OBJECT_VALUES.find { |v| v <= max_value }
      potential_art_objects = ArtObject.where(cost_in_gp: value)
      roll = DiceInteractor.roll(sides: potential_art_objects.count)
      potential_art_objects.offset(roll - 1).first
    end
  end
end

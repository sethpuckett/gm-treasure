# frozen_string_literal: true

class RollTable
  attr_accessor :dice_count, :dice_sides

  def initialize(dice_count: 1, dice_sides: 6)
    @dice_count = dice_count
    @dice_sides = dice_sides
  end

  # rubocop:disable Metrics/ParameterLists
  def add_prospect(min:, max:, type:, count:, sides:, multiplier: 1)
    prospect = {
      min: min,
      max: max,
      type: type,
      count: count,
      sides: sides,
      multiplier: multiplier
    }
    raise ArgumentError, 'Invalid prospect' unless input_valid?(prospect)

    prospects << prospect
  end
  # rubocop:enable Metrics/ParameterLists

  def prospects
    @prospects ||= []
  end

  private

  def input_valid?(prospect)
    prospect[:min].between?(0, 100) &&
      prospect[:max].between?(0, 100) &&
      prospect[:count].between?(0, 100) &&
      prospect[:multiplier].between?(0, 100) &&
      Constant.valid_treasure_type?(propspect[:type]) &&
      Constant.valid_dice_sides?(prospect[:sides])
  end
end

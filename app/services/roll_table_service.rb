# frozen_string_literal: true

class RollTableService
  class << self
    def evaluate(roll_table)
      raise ArgumentError, 'dice_count must be set' if roll_table.dice_count.blank?
      raise ArgumentError, 'dice_sides must be set' if roll_table.dice_sides.blank?
      raise ArgumentError, 'roll table contains no prospects' if roll_table.prospects.empty?

      dice_check = DiceInteractor.roll(count: roll_table.dice_count, sides: roll_table.dice_sides)
      haul = TreasureHaul.new

      roll_table.prospects.each do |prospect|
        prospect_treasure = evaluate_prospect(prospect, dice_check)
        merge_treasure!(haul, prospect_treasure)
      end

      haul
    end
  end

  private

  def evaluate_prospect(prospect, dice_check)
    total = 0
    if dice_check.between?(prospect.min, prospect.max)
      treasure_roll = DiceInteractor.roll(count: prospect.count, sides: prospect.sides)
      total = treasure_roll * prospect.multiplier
    end

    { prospect.type => total }
  end

  def merge_treasure!(haul, new_treasure)
    new_treasure.each do |key, value|
      haul[key] += value
    end
  end
end

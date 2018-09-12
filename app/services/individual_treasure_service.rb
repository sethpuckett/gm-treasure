# frozen_string_literal: true

class IndividualTreasureService
  class << self
    def individual_treasure(challenge_rating:)
      raise ArgumentError, "Invalid challenge rating #{challenge_rating}" unless challenge_rating >= 0

      case challenge_rating
      when 0..4 then treasure_0_to_4
      when 5..10 then treasure_5_to_10
      when 11..16 then treasure_11_to_16
      else treasure_17_and_up
      end
    end

    private

    def treasure_0_to_4
      roll_table = RollTable.new
      roll_table.add_prospect(min: 1, max: 30, type: :cp, count: 5, sides: 6)
      roll_table.add_prospect(min: 31, max: 60, type: :sp, count: 4, sides: 6)
      roll_table.add_prospect(min: 61, max: 70, type: :ep, count: 3, sides: 6)
      roll_table.add_prospect(min: 71, max: 95, type: :gp, count: 3, sides: 6)
      roll_table.add_prospect(min: 96, max: 100, type: :pp, count: 1, sides: 6)

      RollTableService.evaluate(roll_table)
    end

    # rubocop:disable Metrics/MethodLength
    def treasure_5_to_10
      roll_table = RollTable.new
      roll_table.add_prospect(min: 1, max: 30, type: :cp, count: 4, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 1, max: 30, type: :ep, count: 1, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 31, max: 60, type: :sp, count: 6, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 31, max: 60, type: :gp, count: 2, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 61, max: 70, type: :ep, count: 3, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 61, max: 70, type: :gp, count: 2, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 71, max: 95, type: :gp, count: 4, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 96, max: 100, type: :gp, count: 2, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 96, max: 100, type: :pp, count: 3, sides: 6)

      RollTableService.evaluate(roll_table)
    end
    # rubocop:enable Metrics/MethodLength

    def treasure_11_to_16
      roll_table = RollTable.new
      roll_table.add_prospect(min: 1, max: 20, type: :sp, count: 4, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 1, max: 20, type: :gp, count: 1, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 21, max: 35, type: :ep, count: 1, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 21, max: 35, type: :gp, count: 1, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 36, max: 75, type: :gp, count: 2, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 36, max: 75, type: :pp, count: 1, sides: 6, multiplier: 10)
      roll_table.add_prospect(min: 76, max: 100, type: :gp, count: 2, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 76, max: 100, type: :pp, count: 2, sides: 6, multiplier: 10)

      RollTableService.evaluate(roll_table)
    end

    def treasure_17_and_up
      roll_table = RollTable.new
      roll_table.add_prospect(min: 1, max: 15, type: :ep, count: 2, sides: 6, multiplier: 1000)
      roll_table.add_prospect(min: 1, max: 15, type: :gp, count: 8, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 16, max: 55, type: :gp, count: 1, sides: 6, multiplier: 1000)
      roll_table.add_prospect(min: 16, max: 55, type: :pp, count: 1, sides: 6, multiplier: 100)
      roll_table.add_prospect(min: 56, max: 100, type: :gp, count: 1, sides: 6, multiplier: 1000)
      roll_table.add_prospect(min: 56, max: 100, type: :pp, count: 2, sides: 6, multiplier: 100)

      RollTableService.evaluate(roll_table)
    end
  end
end

# frozen_string_literal: true

class IndividualTreasureService
  class << self
    def individual_treasure(challenge_rating:)
      raise ArgumentError, "Invalid challenge rating #{challenge_rating}" unless input_valid?(challenge_rating)

      total = DiceInteractor.roll(count: 1, sides: 6)
      TreasureHaul.new(cp: total)
    end

    private

    def input_valid?(challenge_rating)
      challenge_rating >= 0
    end

    def treasure_0_to_4; end
  end
end

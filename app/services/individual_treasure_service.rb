# frozen_string_literal: true

class IndividualTreasureService
  class << self
    def individual_treasure(challenge_rating:)
      raise ArgumentError, "Invalid challenge rating #{challenge_rating}" unless input_valid?(challenge_rating)

      TreasureHaul.new(cp: 5)
    end

    private

    def input_valid?(challenge_rating)
      challenge_rating >= 0
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IndividualTreasureService do
  describe 'individual_treasure' do
    context 'with a valid challenge rating' do
      it 'returns a treasure haul with cr 0 - 4' do
        allow(DiceInteractor).to receive(:roll).and_return(1)
        haul = described_class.individual_treasure(challenge_rating: 1)
        expect(haul).to be_a(TreasureHaul)
      end

      it 'returns a treasure haul with cr 5 - 10' do
        allow(DiceInteractor).to receive(:roll).and_return(1)
        haul = described_class.individual_treasure(challenge_rating: 5)
        expect(haul).to be_a(TreasureHaul)
      end

      it 'returns a treasure haul with cr 11 - 16' do
        allow(DiceInteractor).to receive(:roll).and_return(1)
        haul = described_class.individual_treasure(challenge_rating: 11)
        expect(haul).to be_a(TreasureHaul)
      end

      it 'returns a treasure haul with cr 17+' do
        allow(DiceInteractor).to receive(:roll).and_return(1)
        haul = described_class.individual_treasure(challenge_rating: 17)
        expect(haul).to be_a(TreasureHaul)
      end
    end

    context 'with invalid challenge rating' do
      let(:bad_call) { described_class.individual_treasure(challenge_rating: -1) }

      it 'raises an argument error' do
        expect { bad_call }.to raise_error(ArgumentError)
      end
    end
  end
end

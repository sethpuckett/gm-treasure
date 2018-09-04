# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiceInteractor do
  context 'with invalid input' do
    it 'raises error with invalid sides' do
      expect { DiceInteractor.roll(count: 1, sides: -1, constant: 0) }.to raise_error(ArgumentError)
      expect { DiceInteractor.roll(count: 1, sides: 3, constant: 0) }.to raise_error(ArgumentError)
    end

    it 'raises error with invalid constant' do
      expect { DiceInteractor.roll(count: 1, sides: 6, constant: -1_000_001) }.to raise_error(ArgumentError)
      expect { DiceInteractor.roll(count: 1, sides: 6, constant: 1_000_001) }.to raise_error(ArgumentError)
    end

    it 'raises error with invalid count' do
      expect { DiceInteractor.roll(count: 0, sides: 6, constant: 0) }.to raise_error(ArgumentError)
      expect { DiceInteractor.roll(count: 101, sides: 6, constant: 0) }.to raise_error(ArgumentError)
    end
  end

  context 'with valid input' do
    let(:response) do
      {
        'total': 4,
        'values': [4],
        'constant': 0
      }
    end

    it 'calls http service' do
      expect(HTTParty).to receive(:get).and_return(response)
      DiceInteractor.roll(count: 1, sides: 6, constant: 0)
    end

    it 'returns total value' do
      allow(HTTParty).to receive(:get).and_return(response)
      total = DiceInteractor.roll(count: 1, sides: 6, constant: 0)

      expect(total).to eq(4)
    end
  end
end


# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TreasureHaul do
  describe 'add' do
    context 'with valid type' do
      it 'aggregates value' do
        haul = TreasureHaul.new(cp: 1)
        haul.add(:cp, 1)
        expect(haul.cp).to eq(2)
      end
    end

    context 'with invalid type' do
      it 'raises ArgumentError' do
        haul = TreasureHaul.new
        expect { haul.add(:invalid, 1) }.to raise_error(ArgumentError)
      end
    end
  end
end

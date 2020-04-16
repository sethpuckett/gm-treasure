# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GemstoneService do
  let(:cost) { 1_000 }

  before do
    FactoryBot.create(:gemstone, cost_in_gp: cost)

    allow(DiceInteractor).to receive(:roll).and_return(1)
  end

  describe '.generate' do
    context 'with value for 2 gemstones and single=false' do
      let(:value) { cost * 2 }

      it 'returns gemset with 2 gems' do
        gemset = GemstoneService.generate(value: value, single: false)
        expect(gemset[:gems].count).to eq(2)
      end

      it 'returns gemset with appropriate total value' do
        gemset = GemstoneService.generate(value: value, single: false)
        expect(gemset[:total_cost_in_gp]).to eq(2_000)
      end
    end

    context 'with valid value and single=true' do
      let(:value) { cost * 2 }

      it 'returns gemset with a single gem' do
        gemset = GemstoneService.generate(value: value, single: true)
        expect(gemset[:gems].count).to eq(1)
      end

      it 'returns gemset with appropriate total value' do
        gemset = GemstoneService.generate(value: value, single: true)
        expect(gemset[:total_cost_in_gp]).to eq(1_000)
      end
    end

    context 'with invalid value' do
      let(:value) { 0 }

      it 'returns error' do
        gemset = GemstoneService.generate(value: value)
        expect(gemset[:error]).not_to be nil
      end
    end
  end
end

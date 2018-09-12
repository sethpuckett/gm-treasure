# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RollTable do
  describe 'add_prospect' do
    context 'with valid input' do
      let(:prospect) do
        {
          min: 1,
          max: 100,
          type: :cp,
          count: 2,
          sides: 10,
          multiplier: 2
        }
      end
      it 'adds prospect' do
        roll_table = RollTable.new
        roll_table.add_prospect(prospect)

        expect(roll_table.prospects.length).to eq(1)
        expect(roll_table.prospects.first).to eq(prospect)
      end
    end

    context 'with invalid input' do
      let(:invalid_prospect) do
        {
          min: 1,
          max: 101,
          type: :cp,
          count: 2,
          sides: 10,
          multiplier: 2
        }
      end
      it 'raises ArgumentError' do
        roll_table = RollTable.new
        expect { roll_table.add_prospect(invalid_prospect) }.to raise_error(ArgumentError)
      end
    end

    context 'with invalid initialization' do
      it 'raises ArgumentError' do
        expect { RollTable.new(dice_count: 101, dice_sides: 5) }.to raise_error(ArgumentError)
      end
    end
  end
end

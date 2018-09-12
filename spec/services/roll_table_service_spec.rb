# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RollTableService do
  describe 'evaluate' do
    let(:dice_value) { 1 }
    let(:treasure_type) { :cp }

    context 'with a single overlapping prospect' do
      let(:prospect) { { min: 1, max: 100, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:roll_table) do
        table = RollTable.new
        table.add_prospect(prospect)
        table
      end

      it 'includes the prospect' do
        allow(DiceInteractor).to receive(:roll).and_return(dice_value)
        haul = described_class.evaluate(roll_table)
        expect(haul.send(treasure_type)).to eq(dice_value)
      end
    end

    context 'with multiple overlapping prospects of different types' do
      let(:treasure_type_2) { :sp }
      let(:prospect_1) { { min: 1, max: 100, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:prospect_2) { { min: 1, max: 100, type: treasure_type_2, count: 1, sides: 6, multiplier: 1 } }
      let(:roll_table) do
        table = RollTable.new
        table.add_prospect(prospect_1)
        table.add_prospect(prospect_2)
        table
      end

      it 'includes all prospects' do
        allow(DiceInteractor).to receive(:roll).and_return(dice_value)
        haul = described_class.evaluate(roll_table)
        expect(haul.send(treasure_type)).to eq(dice_value)
        expect(haul.send(treasure_type_2)).to eq(dice_value)
      end
    end

    context 'with multiple overlapping prospects of the same type' do
      let(:prospect_1) { { min: 1, max: 100, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:prospect_2) { { min: 1, max: 100, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:roll_table) do
        table = RollTable.new
        table.add_prospect(prospect_1)
        table.add_prospect(prospect_2)
        table
      end

      it 'merges treasure haul' do
        allow(DiceInteractor).to receive(:roll).and_return(dice_value)
        haul = described_class.evaluate(roll_table)
        expect(haul.send(treasure_type)).to eq(dice_value * 2)
      end
    end

    context 'with non-overlapping prospects' do
      let(:dice_value) { 50 }
      let(:prospect_1) { { min: 1, max: 49, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:prospect_2) { { min: 51, max: 100, type: treasure_type, count: 1, sides: 6, multiplier: 1 } }
      let(:roll_table) do
        table = RollTable.new
        table.add_prospect(prospect_1)
        table.add_prospect(prospect_2)
        table
      end

      it 'does not include prospects' do
        allow(DiceInteractor).to receive(:roll).and_return(dice_value)
        haul = described_class.evaluate(roll_table)
        expect(haul.send(treasure_type)).to eq(0)
      end
    end

    context 'with no prospects' do
      let(:roll_table) { RollTable.new }

      it 'raises ArgumentError' do
        expect { described_class.evaluate(roll_table) }.to raise_error(ArgumentError)
      end
    end
  end
end

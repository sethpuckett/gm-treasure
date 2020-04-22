# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtObjectService do
  let(:cost) { 2500 }

  before do
    FactoryBot.create(:art_object, cost_in_gp: cost)

    allow(DiceInteractor).to receive(:roll).and_return(1)
  end

  describe '.generate' do
    context 'with value for 2 art_objects and single=false' do
      let(:value) { cost * 2 }

      it 'returns art_object_set with 2 art_objects' do
        art_object_set = ArtObjectService.generate(value: value, single: false)
        expect(art_object_set[:art_objects].count).to eq(2)
      end

      it 'returns art_object_set with appropriate total value' do
        art_object_set = ArtObjectService.generate(value: value, single: false)
        expect(art_object_set[:total_cost_in_gp]).to eq(5000)
      end
    end

    context 'with valid value and single=true' do
      let(:value) { cost * 2 }

      it 'returns art_object_set with a single art_object' do
        art_object_set = ArtObjectService.generate(value: value, single: true)
        expect(art_object_set[:art_objects].count).to eq(1)
      end

      it 'returns art_object_set with appropriate total value' do
        art_object_set = ArtObjectService.generate(value: value, single: true)
        expect(art_object_set[:total_cost_in_gp]).to eq(2500)
      end
    end

    context 'with invalid value' do
      let(:value) { 0 }

      it 'returns error' do
        art_object_set = ArtObjectService.generate(value: value)
        expect(art_object_set[:error]).not_to be nil
      end
    end
  end
end

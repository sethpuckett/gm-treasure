# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TreasureController, type: :controller do
  describe '#individual_treasure' do
    let(:individual_treasure_params) { { cr: 1 } }

    before do
      allow(IndividualTreasureService).to receive(:individual_treasure)
    end

    it 'has 200 response' do
      get :individual_treasure, params: individual_treasure_params
      expect(response.status).to eq(200)
    end
  end
end

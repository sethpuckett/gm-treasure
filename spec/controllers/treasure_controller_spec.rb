# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TreasureController, type: :controller do
  describe 'GET /individual' do
    let(:individual_treasure_params) { { cr: 1 } }

    it 'has json response type' do
      get :individual_treasure, params: individual_treasure_params
      expect(subject.content_type).to eq('application/json')
    end

    it 'has 200 response' do
      get :individual_treasure, params: individual_treasure_params
      expect(subject.status).to eq(200)
    end
  end
end

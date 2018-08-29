# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TreasureController, type: :controller do
  describe 'GET /individual' do
    it 'has json response type' do
      get :individual_treasure
      expect(subject.content_type).to eq('application/json')
    end

    it 'has 200 response' do
      get :individual_treasure
      expect(subject.status).to eq(200)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GemstonesController, type: :controller do
  describe '#index' do
    let(:fail_response) { { error: 'error' } }
    let(:success_response) do
      {
        total_cost_in_gp: 1000,
        gems: []
      }
    end

    before do
      allow(GemstoneService).to receive(:generate).and_return(success_response)
    end

    context 'when value is specified and single is true' do
      let(:params) { { value: 1000 } }
      let(:expected_json) do
        {
          total_cost_in_gp: 1000,
          gems: []
        }
      end

      it 'has 200 response' do
        get :index, params: params, as: :json
        expect(response.status).to eq(200)
      end

      it 'renders gemstone response' do
        get :index, params: params, as: :json
        expect(response.body).to eq(expected_json)
      end
    end

    context 'when value is specified and single is not specified' do
    end

    context 'when value is not specified' do
    end
  end
end

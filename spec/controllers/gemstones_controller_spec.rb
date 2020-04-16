# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GemstonesController, type: :controller do
  let(:gem) { FactoryBot.create(:gemstone) }

  describe '#index' do
    render_views

    context 'when value is specified' do
      let(:params) { { value: 1000 } }
      let(:success_response) do
        {
          total_cost_in_gp: 1000,
          gems: [gem]
        }
      end
      let(:expected_json) do
        {
          gems: [{
            name: gem.name,
            description: gem.description,
            cost_in_gp: gem.cost_in_gp
          }],
          total_cost_in_gp: 1000
        }.to_json
      end

      before do
        allow(GemstoneService).to receive(:generate).and_return(success_response)
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

    context 'when value is not specified' do
      let(:params) { nil }

      it 'has 400 response' do
        get :index, params: params, as: :json
        expect(response.status).to eq(400)
      end
    end

    context 'when GemstoneService returns error' do
      let(:params) { { value: 1000 } }
      let(:fail_response) { { error: 'error' } }

      before do
        allow(GemstoneService).to receive(:generate).and_return(fail_response)
      end

      it 'has 400 response' do
        get :index, params: params, as: :json
        expect(response.status).to eq(400)
      end
    end
  end
end

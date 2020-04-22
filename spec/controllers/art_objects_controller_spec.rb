# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtObjectsController, type: :controller do
  let(:art_object) { FactoryBot.create(:art_object) }

  describe '#index' do
    render_views

    context 'when value is specified' do
      let(:params) { { value: 2500 } }
      let(:success_response) do
        {
          total_cost_in_gp: 2500,
          art_objects: [art_object]
        }
      end
      let(:expected_json) do
        {
          art_objects: [{
            name: art_object.name,
            cost_in_gp: art_object.cost_in_gp
          }],
          total_cost_in_gp: 2500
        }.to_json
      end

      before do
        allow(ArtObjectService).to receive(:generate).and_return(success_response)
      end

      it 'has 200 response' do
        get :index, params: params, as: :json
        expect(response.status).to eq(200)
      end

      it 'renders art_object response' do
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

    context 'when ArtObjectService returns error' do
      let(:params) { { value: 1000 } }
      let(:fail_response) { { error: 'error' } }

      before do
        allow(ArtObjectService).to receive(:generate).and_return(fail_response)
      end

      it 'has 400 response' do
        get :index, params: params, as: :json
        expect(response.status).to eq(400)
      end
    end
  end
end

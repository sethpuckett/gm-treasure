# frozen_string_literal: true

class GemstonesController < ApplicationController
  def index
    @response = GemstoneService.generate(value: value, single: single)
    render json: { error: @response[:error] }, status: :bad_request if @response[:error].present?
  end

  def value
    params.require(:value).to_i
  end

  def single
    params[:single] || false
  end
end

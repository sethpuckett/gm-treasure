# frozen_string_literal: true

class TreasureController < ApplicationController
  def individual_treasure
    response = IndividualTreasureService.individual_treasure(challenge_rating: cr_param)
    render json: response, status: 200
  end

  private

  def cr_param
    params.require(:cr).to_i
  end
end

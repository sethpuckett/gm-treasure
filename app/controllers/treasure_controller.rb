# frozen_string_literal: true

class TreasureController < ApplicationController
  def individual_treasure
    render json: { value: 1 }, status: 200
  end
end

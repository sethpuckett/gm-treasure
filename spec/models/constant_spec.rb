# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Constant do
  describe 'valid_treasure_type?' do
    it 'returns true for valid type' do
      expect(Constant.valid_treasure_type?(:cp)). to be true
    end

    it 'returns false for invalid type' do
      expect(Constant.valid_treasure_type?(:invalid)). to be false
    end
  end

  describe 'valid_dice_sides?' do
    it 'returns true for valid sides' do
      expect(Constant.valid_dice_sides?(6)). to be true
    end

    it 'returns false for invalid sides' do
      expect(Constant.valid_dice_sides?(1)). to be false
    end
  end
end

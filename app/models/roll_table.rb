class RollTable
  attr_accessor :dice_count, :dice_sides

  def initialize(dice_count: 1, dice_sides: 6)
    @dice_count = dice_count
    @dice_sides = dice_sides
  end

  def add_prospect(min:, max:, type:, count:, sides:, multiplier: 1)
    prospect = {
      min: params[:min],
      max: params[:max],
      type: params[:type],
      count: params[:count],
      sides: params[:sides],
      multiplier: params[:multiplier]
    }
    raise ArgumentError, 'Invalid prospect' unless input_valid?(prospect)

    prospects << prospect
  end

  def prospects
    @prospects ||= []
  end

  private

  def input_valid?(prospect)
    prospect[:min] > 0 &&
    prospect[:min] <= 100 &&
    prospect[:max] > 0 &&
    prospect[:max] <= 100 &&
    Constant::valid_treasure_type?(propspect[:type]) &&
    prospect[:count] > 0 &&
    prospect[:count] <= 100 &&
    Constant::valid_dice_sides?(prospect[:sides]) &&
    prospect[:multiplier] > 0 &&
    prospect[:multiplier] <= 100
  end
end

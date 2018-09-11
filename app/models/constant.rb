class Constant
  class << self
    def treasure_types
      [:cp, :sp, :ep, :gp, :pp]
    end

    def valid_treasure_type?(val)
      treasure_types.include?(val)
    end

    def dice_sides
      [4, 6, 8, 10, 12, 20, 100]
    end

    def valid_dice_sides?(val)
      dice_sides.include?(val)
    end
  end
end
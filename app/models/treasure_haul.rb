# frozen_string_literal: true

class TreasureHaul
  attr_accessor :cp, :sp, :ep, :gp, :pp
  def initialize(cp: 0, sp: 0, ep: 0, gp: 0, pp: 0)
    @cp = cp
    @sp = sp
    @ep = ep
    @gp = gp
    @pp = pp
  end

  def add(type, value)
    case type
    when :cp then @cp += value
    when :sp then @sp += value
    when :ep then @ep += value
    when :gp then @gp += value
    when :pp then @pp += value
    else raise ArgumentError, "Invalid type '#{type}'"
    end
  end
end

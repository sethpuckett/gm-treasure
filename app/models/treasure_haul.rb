# frozen_string_literal: true

class TreasureHaul
  attr_accessor :cp, :sp, :ep, :gp, :pp

  # rubocop:disable Naming/UncommunicativeMethodParamName
  def initialize(cp: 0, sp: 0, ep: 0, gp: 0, pp: 0)
    @cp = cp
    @sp = sp
    @ep = ep
    @gp = gp
    @pp = pp
  end
  # rubocop:enable Naming/UncommunicativeMethodParamName
end

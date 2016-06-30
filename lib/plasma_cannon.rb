require_relative 'Weapon'

class PlasmaCannon < Weapon
  NAME = "Plasma Cannon"
  WEIGHT = 200
  DEFAULT_DAMAGE = 55

  def initialize
    super(NAME, WEIGHT, DEFAULT_DAMAGE)
  end

end
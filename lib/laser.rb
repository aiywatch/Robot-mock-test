require_relative 'weapon'

class Laser < Weapon
  NAME = "Laser"
  WEIGHT = 125
  DEFAULT_DAMAGE = 25

  def initialize
    super(NAME, WEIGHT, DEFAULT_DAMAGE)
  end

end
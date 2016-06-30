require_relative 'Weapon'
require_relative 'Robot'

class SpecialWeapon < Weapon
  NAME = 'SpecialWeapon'
  WEIGHT = 20
  DEFAULT_DAMAGE = 20

  def initialize
    super(NAME, WEIGHT, DEFAULT_DAMAGE)
  end

  def hit(x, y)
    robots = Robot.in_position(x, y)
    robots.each{ |robot| robot.direct_damage(damage)}
  end

end
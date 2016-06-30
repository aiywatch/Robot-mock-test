require_relative 'item'

class BoxOfBolts < Item
  NAME = "Box of bolts"
  WEIGHT = 25
  HEAL_POWER = 20
  
  attr_reader

  def initialize
    super(NAME, WEIGHT)
  end

  def feed(robot)
    robot.heal(HEAL_POWER)
  end
end
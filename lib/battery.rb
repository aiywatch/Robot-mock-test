require_relative 'item'

class Battery < Item
  NAME = 'Battery'
  WEIGHT = 25

  def initialize
    super(NAME, WEIGHT)
  end

  def recharge(robot)
    robot.recharged()
  end

end
# require_relative 'weapon'
require_relative 'error'

class Robot
  CAPACITY = 250
  MAX_HEALTH = 100
  DEFAULT_DMG = 5

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = MAX_HEALTH
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    item.feed(self) if healable?(item)
    if items_weight + item.weight <= CAPACITY
      @equipped_weapon = item if item.is_a?(Weapon)
      @items << item 
    end
  end

  def items_weight
    @items.inject(0){ |sum, item| sum + item.weight }
  end

  def wound(dmg)
    @health -= dmg
    @health = 0 if health < 0
  end

  def heal(hp)
    @health += hp
    @health = MAX_HEALTH if @health > MAX_HEALTH
  end

  def heal!(hp)
    raise RobotAlreadyDeadError, "Can not heal if the robot is already dead" if health <= 0
    @health += hp
    @health = MAX_HEALTH if @health > MAX_HEALTH
  end

  def attack(robot)
    if attackable?(robot)
      robot.wound(DEFAULT_DMG)
      equipped_weapon.hit(robot) unless equipped_weapon.nil? or equipped_weapon.is_a?(Grenade)
      @equipped_weapon = nil if equipped_weapon.is_a?(Grenade)
    end
  end

  def attack!(robot)
    raise UnattackableEnemy, "Can attack only Robot type" unless robot.is_a?(Robot)
    if attackable?(robot)
      robot.wound(DEFAULT_DMG)
      equipped_weapon.hit(robot) unless equipped_weapon.nil?
    end
  end

  def attackable?(robot)
    (self.position[0] - robot.position[0]).abs + 
    (self.position[1] - robot.position[1]).abs <= equipped_weapon.range
  end

  def healable?(item)
    item.is_a?(BoxOfBolts) && health <= 80
  end
end





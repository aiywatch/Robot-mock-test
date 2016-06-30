# require_relative 'weapon'

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

  def attack(robot)
    robot.wound(DEFAULT_DMG)
    equipped_weapon.hit(robot) unless equipped_weapon.nil?
  end

end





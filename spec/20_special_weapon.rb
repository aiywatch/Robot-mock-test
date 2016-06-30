require_relative 'spec_helper'

describe SpecialWeapon do
  before :all do
    @sw = SpecialWeapon.new

    @r1 = Robot.new
    @r2 = Robot.new
    @r3 = Robot.new
    @r4 = Robot.new
    @r5 = Robot.new
    @r6 = Robot.new
    @r1.move_right
    @r3.move_right
    @r2.move_right
    @r2.move_right
  end

  describe "#initialize" do
    it "is a weapon" do
      expect(@sw).to be_a Weapon
      expect(@sw).to be_a SpecialWeapon
    end
  end

  describe "#hit" do
    it "target position instead of single target" do
      @sw.hit(1, 2)
    end

    it "span damage to all robots in the position" do
      expect(@r1).to receive(:direct_damage).with(20)
      expect(@r3).to receive(:direct_damage).with(20)
      @sw.hit(1, 0)
    end

    it "deal direct damage to the damaged robots" do
      @sw.hit(0, 0)

      expect(@r5.health).to eq(80)
      expect(@r5.shield).to eq(50)
      expect(@r6.health).to eq(80)
      expect(@r6.shield).to eq(50)
    end
  end
end
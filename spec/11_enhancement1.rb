require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "should raise exception if its health <= 0" do
      expect(@robot).to receive(:health) { 0 }
      expect{ @robot.heal!(25) }.to raise_error(StandardError)
    end

    it "should be able to heal normally if the robot is not dead" do
      @robot.wound(50)
      @robot.heal!(20)
      expect(@robot.health).to eql(70)
    end
  end

  describe "#attack!" do
    it "should raise exception if it attack non robot" do
      laser = Laser.new
      expect { @robot.attack!(laser) }.to raise_error(UnattackableEnemy)
    end

    it "should be able to attack to Robot normally" do
      robot2 = Robot.new
      expect(robot2).to receive(:wound).with(5)
      @robot.attack!(robot2)
    end
  end

end
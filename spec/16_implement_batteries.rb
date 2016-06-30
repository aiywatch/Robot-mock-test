require_relative 'spec_helper'

describe Battery do
  before :each do
    @battery = Battery.new
  end

  let(:robot) { Robot.new }

  describe "#initialzie" do
    it "should have name" do
      expect(@battery.name).to eq('Battery')
    end

    it "should weigh 25" do
      expect(@battery.weight).to eq(25)
    end

    it "can recharge robot" do
      robot.wound(70)
      @battery.recharge(robot)
      expect(robot.shield).to eq(50)
      expect(robot.health).to eq(80)
    end
  end
end
require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  it "should be initialize with 50 shield" do
    expect(@robot.shield).to eq(50)
  end

  describe "#wound" do
    it "should first drain shield before health" do
      @robot.wound(40)
      expect(@robot.health).to eq(100)
      expect(@robot.shield).to eq(10)
    end

    it "should drain health when shield is 0" do
      allow(@robot).to receive(:shield){ 0 }
      @robot.wound(20)
      expect(@robot.health).to eq(80)
    end
  end
end
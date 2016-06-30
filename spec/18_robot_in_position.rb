require_relative 'spec_helper'

describe Robot do
  before :all do
    @r1 = Robot.new
    @r2 = Robot.new
    @r3 = Robot.new
    @r4 = Robot.new
    @r1.move_right
    @r3.move_right
    @r2.move_right
    @r2.move_right
  end

  describe ".in_position(x, y)" do
    it "return all robots in position (x, y" do
      robots = Robot.in_position(1, 0)
      expect(robots).to be_a Array
      expect(robots).to match_array [@r1, @r3]
    end
  end

  describe "#scanning" do
    it "scan its surroundings (tiles immediately next to its current @position)" do
      robots = @r2.scanning
      expect(robots).to be_a Array
      expect(robots).to match_array [@r1, @r3]
    end
  end
end
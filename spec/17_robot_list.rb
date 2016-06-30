require_relative 'spec_helper'

describe Robot do
  it "should keep track of all robots" do
    r1 = Robot.new
    r2 = Robot.new
    r3 = Robot.new

    robots = Robot.robots[-3..-1]

    expect(robots[0]).to eq(r1)
    expect(robots[1]).to eq(r2)
    expect(robots[2]).to eq(r3)
    # expect(Robot.robots.size).to eq(3)
    # expect(Robot.robots[0]).to eq(r1)
    # expect(Robot.robots[1]).to eq(r2)
    # expect(Robot.robots[2]).to eq(r3)
  end

end
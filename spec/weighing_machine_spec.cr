# require "spectator"
require "spec"
require "../src/weighing_machine.cr"

describe WeighingMachine do
  it "Test 1" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.@precision.should eq(3)
    weighing_machine.@metric.should be_true
    weighing_machine.@weight.should eq(0.0)
  end

  it "Test 2" do
    weighing_machine = WeighingMachine.new(5, true)
    weighing_machine.@precision.should eq(5)
    weighing_machine.@metric.should be_true
    weighing_machine.@weight.should eq(0.0)
  end

  it "Test 3" do
    weighing_machine = WeighingMachine.new(3, false)
    weighing_machine.@precision.should eq(3)
    weighing_machine.@metric.should be_false
    weighing_machine.@weight.should eq(0.0)
  end

  it "test 4" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.weigh.should eq("0.0")
  end

  it "test 5" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.precision.should eq(3)
  end

  it "test 6" do
    weighing_machine = WeighingMachine.new(5, true)
    weighing_machine.precision.should eq(5)
  end

  it "test 7" do
    # {% if WeighingMachine.has_method? "precision=" %}
    #   raise "Error: precision should not have a setter"
    # {% end %}
  end

  it "test 8" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.weight.should eq(0.0)
  end

  it "test 9" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.weight = 5.0
    weighing_machine.weight.should eq(5.0)
  end

  it "test 10" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.weight = 5.0
    weighing_machine.weigh.should eq("5.0")
  end

  it "test 11" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.metric = false
    weighing_machine.@metric.should eq(false)
  end

  it "test 12" do
    weighing_machine = WeighingMachine.new(3, false)
    weighing_machine.metric = true
    weighing_machine.@metric.should eq(true)
  end

  it "test 13" do
    weighing_machine = WeighingMachine.new(3, true)
    weighing_machine.weight = 5.0
    weighing_machine.metric = false
    weighing_machine.weigh.should eq("11.023")
  end

  it "test 14" do
    # {% if WeighingMachine.has_method? "metric" %}
    #   raise "Error: metric should not have a getter"
    # {% end %}
  end
end

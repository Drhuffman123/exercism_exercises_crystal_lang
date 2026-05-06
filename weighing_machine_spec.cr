# require "spectator"
require "spec"
require "../src/weighing_machine.cr"

describe WeighingMachine do
  # describe "foo test 1" do
  #   it "correctly reports the number of elements in the Array" do
  #     [1, 2, 3].size.should eq 3
  #   end
  # end

  # describe "#empty?" do
  #   it "is true when no elements are in the array" do
  #     ([] of Int32).empty?.should be_true
  #   end
  #
  #   it "is false if there are elements in the array" do
  #     [1].empty?.should be_false
  #   end
  # end

  describe "test 1" do
    it "be a WeighingMachine" do
      precision = 3
      metric = true
      vm = WeighingMachine.new(precision, metric)
      vm.should be_a(WeighingMachine)
    end
  end

  describe "test 2" do
    it "have the right precision" do
      precision = 3
      metric = true
      vm = WeighingMachine.new(precision, metric)

      vm.precision.should eq(3)
    end
  end

  describe "test 3" do
    precision = 3
    metric = true
    wm : WeighingMachine

    context "WeighingMachine" do
      it "have the right weigh" do
        wm = WeighingMachine.new(precision, metric)
        wm.weight = 60.5
        wm.weight.should eq(60.5)
        # => 60.5
      end
    end
  end

  describe "test 4" do
    precision = 3
    metric = true
    wm = WeighingMachine.new(precision, metric)
    wm.weight = 60.5
    wm.metric = false

    context "WeighingMachine - non-metric" do
      it "has the right weigh" do
        # wm.weigh.should eq("133.377")
        wm.weigh.should eq("133.38")
      end
    end
  end
end

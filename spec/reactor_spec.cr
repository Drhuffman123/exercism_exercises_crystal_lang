require "spec"
require "../src/reactor.cr"

describe Reactor do
  context "Task 1" do
    it "Test 1" do
      Reactor.criticality_balanced?(799, 499).should be_false
    end

    it "Test 2" do
      Reactor.criticality_balanced?(200, 501).should be_true
    end

    it "Test 3" do
      Reactor.criticality_balanced?(800, 500).should be_false
    end

    it "Test 4" do
      Reactor.criticality_balanced?(2000, 400).should be_false
    end
  end

  context "TASK 2" do
    it "Test 5" do
      Reactor.reactor_efficiency(200, 60, 15000).should eq "green"
    end

    it "Test 6" do
      Reactor.reactor_efficiency(150, 45, 10000).should eq "orange"
    end

    it "Test 7" do
      Reactor.reactor_efficiency(100, 29, 5000).should eq "red"
    end

    it "Test 8" do
      Reactor.reactor_efficiency(50, 14, 2500).should eq "black"
    end
  end

  context "TASK 3" do
    it "Test 9" do
      Reactor.fail_safe(10, 400, 10000).should eq "LOW"
    end

    it "Test 10" do
      Reactor.fail_safe(10, 899, 10000).should eq "LOW"
    end

    it "Test 11" do
      Reactor.fail_safe(10, 901, 10000).should eq "NORMAL"
    end

    it "Test 12" do
      Reactor.fail_safe(10, 1099, 10000).should eq "NORMAL"
    end

    it "Test 13" do
      Reactor.fail_safe(10, 1101, 10000).should eq "DANGER"
    end
  end
end

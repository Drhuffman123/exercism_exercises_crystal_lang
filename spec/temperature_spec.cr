require "spec"
require "../src/temperature.cr"

describe Temperature do
  context "Test 1" do
    it "test 1" do
      Temperature.new.to_kelvin(0).should eq 273.15
    end

    it "test 2" do
      Temperature.new.to_kelvin(-273.15).should eq 0
    end

    it "test 3" do
      Temperature.new.to_kelvin(-100).should be_close 173.15, 0.001
    end

    it "test 4" do
      Temperature.new.to_kelvin(100).should eq 373.15
    end
  end

  context "Test 2" do
    it "test 5" do
      Temperature.new.round(1.12).should eq 1.1
    end

    it "test 6" do
      Temperature.new.round(1).should eq 1
    end

    it "test 7" do
      Temperature.new.round(-273.15).should eq -273.2
    end

    it "test 8" do
      Temperature.new.round(1.1).should eq 1.1
    end
  end

  context "Test 3" do
    it "test 9" do
      Temperature.new.to_fahrenheit(0).should eq 32
    end

    it "test 10" do
      Temperature.new.to_fahrenheit(-273.15).should eq -459
    end

    it "test 11" do
      Temperature.new.to_fahrenheit(-100).should eq -148
    end

    it "test 12" do
      Temperature.new.to_fahrenheit(100).should eq 212
    end
  end

  context "Test 4" do
    it "test 13" do
      Temperature.new.number_missing_sensors(4).should eq 0
    end

    it "test 14" do
      Temperature.new.number_missing_sensors(3).should eq 1
    end

    it "test 15" do
      Temperature.new.number_missing_sensors(2).should eq 2
    end

    it "test 16" do
      Temperature.new.number_missing_sensors(1).should eq 3
    end

    it "test 17" do
      Temperature.new.number_missing_sensors(15).should eq 1
    end
  end
end

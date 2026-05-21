require "spec"
require "../src/navigation.cr"

describe Navigation do
  context "TASK 1" do
    it "Test 1" do
      distance = Navigation::NEPTUNE_DISTANCE
      distance.should eq 4_400_000_000
      distance.should be_a(Int64)
    end

    it "Test 2" do
      distance = Navigation::MARS_DISTANCE
      distance.should eq 227_940_000
      distance.should be_a(Int32)
    end

    it "Test 3" do
      distance = Navigation::ATMOSPHERE_DISTANCE
      distance.should eq 10_000
      distance.should be_a(Int16)
    end
  end

  context "TASK 2" do
    it "Test 4" do
      result = Navigation.new.correct_area_analysis(9_999)
      result.should eq 9_999
      result.should be_a(UInt32)
    end

    it "Test 5" do
      result = Navigation.new.correct_area_analysis(0)
      result.should eq 0
      result.should be_a(UInt32)
    end
  end

  context "TASK 3" do
    it "Test 6" do
      calculation = Navigation.new.calculate_velocity(1000, 5)
      calculation.should eq 200
      calculation.should be_a(Float32)
    end

    it "Test 7" do
      calculation = Navigation.new.calculate_velocity(502.5, 2.5)
      calculation.should eq 201
      calculation.should be_a(Float32)
    end

    it "Test 8" do
      calculation = Navigation.new.calculate_velocity(4531, 14.6)
      calculation.should eq 310.34247_f32
      calculation.should be_a(Float32)
    end
  end
end

require "spec"
require "../src/armstrong_numbers.cr"

describe ArmstrongNumbers do
  context "Test 1" do
    ArmstrongNumbers.armstrong_number?(0).should eq(true)
  end

  context "Test 2" do
    ArmstrongNumbers.armstrong_number?(5).should eq(true)
  end
  
  context "Test 3" do
    ArmstrongNumbers.armstrong_number?(10).should eq(false)
  end

  context "Test 4" do
    ArmstrongNumbers.armstrong_number?(153).should eq(true)
  end

  context "Test 5" do
    ArmstrongNumbers.armstrong_number?(100).should eq(false)
  end

  context "Test 6" do
    ArmstrongNumbers.armstrong_number?(9474).should eq(true)
  end

  context "Test 7" do
    ArmstrongNumbers.armstrong_number?(9475).should eq(false)
  end

  context "Test 8" do
    ArmstrongNumbers.armstrong_number?(9926315).should eq(true)
  end

  context "Test 9" do
    ArmstrongNumbers.armstrong_number?(9926314).should eq(false)
  end
end

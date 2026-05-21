require "spec"
require "../src/year.cr"

describe Year do
  context "ok" do
    context "Test 1" do
      Year.leap?(2015).should be_false
    end

    context "Test 2" do
      Year.leap?(1970).should be_false
    end

    context "Test 5" do
      Year.leap?(2100).should be_false
    end

    context "Test 6" do
      Year.leap?(1900).should be_false
    end

    context "Test 9" do
      Year.leap?(1800).should be_false
    end
  end

  context "odd" do
    context "Test 3" do
      Year.leap?(1996).should be_true
    end

    context "Test 4" do
      Year.leap?(1960).should be_true
    end

    context "Test 7" do
      Year.leap?(2000).should be_true
    end

    context "Test 8" do
      Year.leap?(2400).should be_true
    end
  end
end

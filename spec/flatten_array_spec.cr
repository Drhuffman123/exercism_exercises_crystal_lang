require "spec"
require "../src/flatten_array.cr"

describe "FlattenArray" do
  context "flatten" do
    it "Test 1" do
      FlattenArray.flatten([] of Int32 | Nil).should eq([] of Int32)
    end

    it "Test 2" do
      FlattenArray.flatten([0, 1, 2]).should eq([0, 1, 2])
    end

    it "Test 3" do
      FlattenArray.flatten(Array(Array(Int32)).new).should eq([] of Int32)
    end
  end

  context "sum of squares" do
    it "Test 4" do
      FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8]).should eq([1, 2, 3, 4, 5, 6, 7, 8])
    end

    it "Test 5" do
      FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]).should eq([0, 2, 2, 3, 8, 100, 4, 50, -2])
    end

    it "Test 6" do
      FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8]).should eq([1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  context "difference of squares" do
    it "Test 7" do
      FlattenArray.flatten([1, 2, nil]).should eq([1, 2])
    end

    it "Test 8" do
      FlattenArray.flatten([nil, nil, 3]).should eq([3])
    end

    it "Test 9" do
      FlattenArray.flatten([1, nil, nil, 4]).should eq([1, 4])
    end

    it "Test 10" do
      FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]).should eq([0, 2, 2, 3, 8, 100, -2])
    end

    it "Test 11" do
      FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]).should eq([] of Int32)
    end
  end
end

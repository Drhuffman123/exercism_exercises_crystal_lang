require "spec"
# require "../src/*" # Come on; lets be reasonable and not overtax our systems!
require "../src/squares.cr"

# describe "DifferenceOfSquares" do
describe "Squares" do
  context "square of sum" do
    it "square of sum 10" do
      Squares.square_of_sum(10).should eq(3025)
    end

    it "square of sum 1" do
      Squares.square_of_sum(1).should eq(1)
    end

    it "square of sum 5" do
      Squares.square_of_sum(5).should eq(225)
    end

    it "square of sum 100" do
      Squares.square_of_sum(100).should eq(25502500)
    end
  end

  context "sum of squares" do
    it "sum of squares 1" do
      Squares.sum_of_squares(1).should eq(1)
    end

    it "sum of squares 5" do
      Squares.sum_of_squares(5).should eq(55)
    end

    it "sum of squares 100" do
      Squares.sum_of_squares(100).should eq(338350)
    end
  end

  context "difference of squares" do
    it "difference of squares 1" do
      Squares.difference_of_squares(1).should eq(0)
    end

    it "difference of squares 5" do
      Squares.difference_of_squares(5).should eq(170)
    end

    it "difference of squares 100" do
      Squares.difference_of_squares(100).should eq(25164150)
    end
  end
end

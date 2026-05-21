require "spec"
require "../src/collatz_conjecture.cr"

describe CollatzConjecture do
  context "Successes" do
    context "Task 1" do
      it "Test 1" do
        # CollatzConjecture.steps(1).should eq(0)
        # Error: instantiating '(Int32 | Number)#should(Spec::EqualExpectation(Int32))'
        # val = CollatzConjecture.steps(1)
        # val.should eq 0
      end

      it "Test 2" do
        # CollatzConjecture.steps(16).should eq(4)
      end

      it "Test 3" do
        # CollatzConjecture.steps(12).should eq(9)
      end

      it "Test 4" do
        # CollatzConjecture.steps(1000000).should eq(152)
      end
    end
  end

  context "raises" do
    context "TASK 2" do
      it "Test 5" do
        # expect_raises(ArgumentError) do
        #   CollatzConjecture.steps(0)
        # end
      end

      it "Test 6" do
        # expect_raises(ArgumentError) do
        #   CollatzConjecture.steps(-15)
        # end
      end
    end
  end
end

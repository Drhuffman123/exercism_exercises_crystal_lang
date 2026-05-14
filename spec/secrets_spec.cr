require "spec"
require "../src/secrets.cr"

describe Secrets do
  context "TAST 1" do
    it "test 1" do
      Secrets.shift_back(15, 0).should eq 15
    end

    it "test 2" do
      Secrets.shift_back(7, 1).should eq 14
    end

    it "test 3" do
      Secrets.shift_back(5, 4).should eq 80
    end

    it "test 4" do
      Secrets.shift_back(96, 4).should eq 0
    end
  end

  context "TASK 2" do
    it "test 5" do
      Secrets.apply_mask(101, 255).should eq 101
    end

    it "test 6" do
      Secrets.apply_mask(101, 0).should eq 0
    end

    it "test 7" do
      Secrets.apply_mask(62, 85).should eq 20
    end
  end

  context "TASK 3" do
    it "test 8" do
      Secrets.set_bits(107, 0).should eq 107
    end

    it "test 9" do
      Secrets.set_bits(107, 255).should eq 255
    end

    it "test 10" do
      Secrets.set_bits(62, 85).should eq 127
    end
  end

  context "TASK 4" do
    it "test 11" do
      Secrets.reverse_xor(106, 255).should eq 106
    end

    it "test 12" do
      Secrets.reverse_xor(106, 0).should eq 149
    end

    it "test 13" do
      Secrets.reverse_xor(62, 85).should eq 148
    end
  end
end

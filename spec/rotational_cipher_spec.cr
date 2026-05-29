require "spec"
require "../src/rotational_cipher.cr"

describe "RotationalCipher" do
  it "an empty string" do
    ReverseString.reverse("").should eq("")
  end

  it "a word" do
    ReverseString.reverse("robot").should eq("tobor")
  end

  it "a capitalized word" do
    ReverseString.reverse("Ramen").should eq("nemaR")
  end

  it "a sentence with punctuation" do
    ReverseString.reverse("I'm hungry!").should eq("!yrgnuh m'I")
  end

  it "a palindrome" do
    ReverseString.reverse("racecar").should eq("racecar")
  end

  it "an even-sized word" do
    ReverseString.reverse("drawer").should eq("reward")
  end

  it "wide characters", tags: "optional" do
    ReverseString.reverse("子猫").should eq("猫子")
  end

  it "grapheme cluster with pre-combined form", tags: "optional" do
    ReverseString.reverse("Würstchenstand").should eq("dnatsnehctsrüW")
  end

  it "grapheme clusters", tags: "optional" do
    ReverseString.reverse("ผู้เขียนโปรแกรม").should eq("มรกแรปโนยขีเผู้")
  end
end

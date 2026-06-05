require "spec"

require "../src/two_fer.cr"

describe "TwoFer" do
  it "no name given" do
    TwoFer.two_fer.should eq("One for you, one for me.")
  end

  it "a name given" do
    TwoFer.two_fer("Alice").should eq("One for Alice, one for me.")
  end

  it "another name given" do
    TwoFer.two_fer("Bob").should eq("One for Bob, one for me.")
  end
end

require "spec"
require "../src/bob.cr"

describe Bob do
  context "Whatever." do
    it "Test 1" do
      Bob.hey("Tom-ay-to, tom-aaaah-to.").should eq("Whatever.")
    end

    it "Test 7" do
      Bob.hey("Hi there!").should eq("Whatever.")
    end

    it "Test 8" do
      Bob.hey("It's OK if you don't want to go work for NASA.").should eq("Whatever.")
    end

    it "Test 11" do
      Bob.hey("1, 2, 3").should eq("Whatever.")
    end

    it "Test 15" do
      Bob.hey("Ending with ? means a question.").should eq("Whatever.")
    end

    it "Test 21" do
      Bob.hey("         hmmmmmmm...").should eq("Whatever.")
    end

    it "Test 24" do
      Bob.hey("This is a statement ending with whitespace      ").should eq("Whatever.")
    end
  end

  context "Whoa, chill out!" do
    it "Test 2" do
      Bob.hey("WATCH OUT!").should eq("Whoa, chill out!")
    end

    it "Test 3" do
      Bob.hey("FCECDFCAAB").should eq("Whoa, chill out!")
    end

    it "Test 10" do
      Bob.hey("1, 2, 3 GO!").should eq("Whoa, chill out!")
    end

    it "Test 13" do
      Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!").should eq("Whoa, chill out!")
    end

    it "Test 14" do
      Bob.hey("I HATE THE DENTIST").should eq("Whoa, chill out!")
    end
  end

  context "Sure." do
    it "Test 4" do
      Bob.hey("Does this cryogenic chamber make me look fat?").should eq("Sure.")
    end

    it "Test 5" do
      Bob.hey("You are, what, like 15?").should eq("Sure.")
    end

    it "Test 6" do
      Bob.hey("fffbbcbeab?").should eq("Sure.")
    end

    it "Test 12" do
      Bob.hey("4?").should eq("Sure.")
    end

    it "Test 16" do
      Bob.hey(":) ?").should eq("Sure.")
    end

    it "Test 17" do
      Bob.hey("Wait! Hang on. Are you going to be OK?").should eq("Sure.")
    end

    it "Test 22" do
      Bob.hey("Okay if like my  spacebar  quite a bit?   ").should eq("Sure.")
    end

    it "Test 25" do
      Bob.hey("\nDoes this cryogenic chamber make\n me look fat?").should eq("Sure.")
    end
  end

  context "Calm down, I know what I'm doing!" do
    it "Test 9" do
      Bob.hey("WHAT'S GOING ON?").should eq("Calm down, I know what I'm doing!")
    end
  end

  context "Fine. Be that way!" do
    it "Test 18" do
      Bob.hey("").should eq("Fine. Be that way!")
    end

    it "Test 19" do
      Bob.hey("          ").should eq("Fine. Be that way!")
    end

    it "Test 20" do
      Bob.hey("\t\t\t\t\t\t\t\t\t\t").should eq("Fine. Be that way!")
    end

    it "Test 23" do
      Bob.hey("\n\r \t").should eq("Fine. Be that way!")
    end
  end
end

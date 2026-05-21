require "spec"
require "../src/bob.cr"

describe Bob do
  context "Whatever." do
    context "Test 1" do
      Bob.hey("Tom-ay-to, tom-aaaah-to.").should eq("Whatever.")
    end

    context "Test 7" do
      Bob.hey("Hi there!").should eq("Whatever.")
    end

    context "Test 8" do
      Bob.hey("It's OK if you don't want to go work for NASA.").should eq("Whatever.")
    end

    context "Test 11" do
      Bob.hey("1, 2, 3").should eq("Whatever.")
    end

    context "Test 15" do
      Bob.hey("Ending with ? means a question.").should eq("Whatever.")
    end

    context "Test 21" do
      Bob.hey("         hmmmmmmm...").should eq("Whatever.")
    end

    context "Test 24" do
      Bob.hey("This is a statement ending with whitespace      ").should eq("Whatever.")
    end
  end

  context "Whoa, chill out!" do
    context "Test 2" do
      Bob.hey("WATCH OUT!").should eq("Whoa, chill out!")
    end

    context "Test 3" do
      Bob.hey("FCECDFCAAB").should eq("Whoa, chill out!")
    end

    context "Test 10" do
      Bob.hey("1, 2, 3 GO!").should eq("Whoa, chill out!")
    end

    context "Test 13" do
      Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!").should eq("Whoa, chill out!")
    end

    context "Test 14" do
      Bob.hey("I HATE THE DENTIST").should eq("Whoa, chill out!")
    end
  end

  context "Sure." do
    context "Test 4" do
      Bob.hey("Does this cryogenic chamber make me look fat?").should eq("Sure.")
    end

    context "Test 5" do
      Bob.hey("You are, what, like 15?").should eq("Sure.")
    end

    context "Test 6" do
      Bob.hey("fffbbcbeab?").should eq("Sure.")
    end

    context "Test 12" do
      Bob.hey("4?").should eq("Sure.")
    end

    context "Test 16" do
      Bob.hey(":) ?").should eq("Sure.")
    end

    context "Test 17" do
      Bob.hey("Wait! Hang on. Are you going to be OK?").should eq("Sure.")
    end

    context "Test 22" do
      Bob.hey("Okay if like my  spacebar  quite a bit?   ").should eq("Sure.")
    end

    context "Test 25" do
      Bob.hey("\nDoes this cryogenic chamber make\n me look fat?").should eq("Sure.")
    end
  end

  context "Calm down, I know what I'm doing!" do
    context "Test 9" do
      Bob.hey("WHAT'S GOING ON?").should eq("Calm down, I know what I'm doing!")
    end
  end

  context "Fine. Be that way!" do
    context "Test 18" do
      Bob.hey("").should eq("Fine. Be that way!")
    end

    context "Test 19" do
      Bob.hey("          ").should eq("Fine. Be that way!")
    end

    context "Test 20" do
      Bob.hey("\t\t\t\t\t\t\t\t\t\t").should eq("Fine. Be that way!")
    end

    context "Test 23" do
      Bob.hey("\n\r \t").should eq("Fine. Be that way!")
    end
  end
end

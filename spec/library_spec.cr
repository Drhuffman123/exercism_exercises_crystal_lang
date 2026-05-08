require "spec"
require "../src/library.cr"

describe Library do
  context "Task 1" do
    it "test 1" do
      Library.first_letter("Mystery of the Crystal Skull").should eq 'M'
    end

    it "test 2" do
      Library.first_letter("Cave and the Crystals").should eq 'C'
    end

    it "test 3" do
      Library.first_letter("A Crystals story").should eq 'A'
    end
  end

  context "Task 2" do
    it "test 1" do
      Library.initials("William", "Shakespeare").should eq "W.S"
    end

    it "test 2" do
      Library.initials("George", "Orwell").should eq "G.O"
    end

    it "test 3" do
      Library.initials("Karin", "Boye").should eq "K.B"
    end
  end

  context "Task 3" do
    it "test 1" do
      Library.decrypt_character('B').should eq 'A'
    end

    it "test 2" do
      Library.decrypt_character('C').should eq 'B'
    end

    it "test 3" do
      Library.decrypt_character('A').should eq 'Z'
    end

    it "test 4" do
      Library.decrypt_character('Z').should eq 'Y'
    end

    it "test 5" do
      Library.decrypt_character('a').should eq 'z'
    end

    it "test 6" do
      Library.decrypt_character('z').should eq 'y'
    end
  end

  context "Task 4" do
    it "test 1" do
      expected = "Hello World!"
      Library.decrypt_text("Ifmmp Xpsme!").should eq expected
    end

    it "test 2" do
      expected = "A town by the area 1000 with the capital."
      Library.decrypt_text("B upxo cz uif bsfb 1000 xjui uif dbqjubm.").should eq expected
    end

    it "test 3" do
      expected = "The quick brown fox jumps over the lazy dog."
      Library.decrypt_text("Uif rvjdl cspxo gpy kvnqt pwfs uif mbaz eph.").should eq expected
    end

    it "test 4" do
      expected = "The quick brown fox jumps $%.!?& over the lazy dog."
      Library.decrypt_text("Uif rvjdl cspxo gpy kvnqt $%.!?& pwfs uif mbaz eph.").should eq expected
    end
  end
end

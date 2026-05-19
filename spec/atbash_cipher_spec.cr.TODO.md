require "spec"
require "../src/atbash_cipher.cr"

describe AtbashCipher do
  context "Test 1" do
    # raise "WE HAVE WHAT?"
    # raise "WE HAVE: #{AtbashCipher.encode("yes")}!"
    # raise "oops"
    AtbashCipher.encode("yes").should eq("bvh")
  end



  context "Test 2" do
    AtbashCipher.encode("no").should eq("ml")
  end

  context "Test 3" do
    AtbashCipher.encode("OMG").should eq("lnt")
  end

  context "Test 4" do
    AtbashCipher.encode("O M G").should eq("lnt")
  end

  context "Test 5" do
    AtbashCipher.encode("mindblowingly").should eq("nrmwy oldrm tob")
  end

  context "Test 6" do
    AtbashCipher.encode("Testing,1 2 3, testing.").should eq("gvhgr mt123 gvhgr mt")
    # "Testing,1 2 3, testing."
    # "gvhgr mt123 gvhgr mt"
  end

  context "Test 7" do
    AtbashCipher.encode("Truth is fiction.").should eq("gifgs rhurx grlm")
  end

  context "Test 8" do
    AtbashCipher.encode("The quick brown fox jumps over the lazy dog.").should eq("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
  end

  context "Test 9" do
    AtbashCipher.decode("vcvix rhn").should eq("exercism")
  end

  context "Test 10" do
    AtbashCipher.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v").should eq("anobstacleisoftenasteppingstone")
  end

  context "Test 11" do
    AtbashCipher.decode("gvhgr mt123 gvhgr mt").should eq("testing123testing")
  end

  context "Test 12" do
    AtbashCipher.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt").should eq("thequickbrownfoxjumpsoverthelazydog")
  end

  context "Test 13" do
    AtbashCipher.decode("vc vix    r hn").should eq("exercism")
  end

  context "Test 14" do
    AtbashCipher.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv").should eq("anobstacleisoftenasteppingstone")
  end
end

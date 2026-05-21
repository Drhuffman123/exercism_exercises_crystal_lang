require "spec"
require "../src/savings_account.cr"

describe SavingsAccount do
  context "TAST 1" do
    it "test 1" do
      SavingsAccount.interest_rate(0.0).should eq(0.5)
    end

    it "test 2" do
      SavingsAccount.interest_rate(0.000001).should eq(0.5)
    end

    it "test 3" do
      SavingsAccount.interest_rate(999.9999).should eq(0.5)
    end

    it "test 4" do
      SavingsAccount.interest_rate(1_000.0).should eq(1.621)
    end

    it "test 5" do
      SavingsAccount.interest_rate(1_000.0001).should eq(1.621)
    end

    it "test 6" do
      SavingsAccount.interest_rate(4_999.999).should eq(1.621)
    end

    it "test 7" do
      SavingsAccount.interest_rate(5_000.0).should eq(2.475)
    end

    it "test 8" do
      SavingsAccount.interest_rate(5_000.0001).should eq(2.475)
    end

    it "test 9" do
      SavingsAccount.interest_rate(5_639_998.742909).should eq(2.475)
    end

    it "test 10" do
      SavingsAccount.interest_rate(-0.000001).should eq(3.213)
    end

    it "test 11" do
      SavingsAccount.interest_rate(-0.123).should eq(3.213)
    end

    it "test 12" do
      SavingsAccount.interest_rate(-152964.2313).should eq(3.213)
    end
  end

  context "TASK 2" do
    it "test 13" do
      SavingsAccount.interest(-10000.0).should be_close(-321.3, 0.001)
    end

    it "test 14" do
      SavingsAccount.interest(555.55).should be_close(2.77775, 0.001)
    end

    it "test 15" do
      SavingsAccount.interest(4999.99).should be_close(81.0498379, 0.001)
    end

    it "test 16" do
      SavingsAccount.interest(34600.80).should be_close(856.3698, 0.001)
    end
  end

  context "TASK 3" do
    it "test 17" do
      SavingsAccount.annual_balance_update(0.0).should be_close(0.0, 0.001)
    end

    it "test 18" do
      SavingsAccount.annual_balance_update(0.000001).should be_close(0.000001005, 0.001)
    end

    it "test 19" do
      SavingsAccount.annual_balance_update(1_000.0).should be_close(1016.2101016210, 0.001)
    end

    it "test 20" do
      SavingsAccount.annual_balance_update(898124017.826243404425).should be_close(920352587.26744292868451875, 0.001)
    end

    it "test 21" do
      SavingsAccount.annual_balance_update(-0.123).should be_close(-0.12695199, 0.001)
    end

    it "test 22" do
      SavingsAccount.annual_balance_update(-152964.231).should be_close(-157878.97174203, 0.001)
    end
  end

  context "TASK 4" do
    it "test 23" do
      SavingsAccount.years_before_desired_balance(100.0, 125.80).should eq(47)
    end

    it "test 24" do
      SavingsAccount.years_before_desired_balance(1_000.0, 1_100.0).should eq(6)
    end

    it "test 25" do
      SavingsAccount.years_before_desired_balance(8_080.80, 9_090.90).should eq(5)
    end

    it "test 26" do
      SavingsAccount.years_before_desired_balance(2_345.67, 12_345.6789).should eq(85)
    end
  end
end

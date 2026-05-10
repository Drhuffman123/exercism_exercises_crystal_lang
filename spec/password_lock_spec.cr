require "spec"
require "../src/password_lock.cr"

describe PasswordLock do
  context "Task 1" do
    it "Test 1" do
      password_lock = PasswordLock.new(1234)
      password_lock.should be_a(PasswordLock)
      password_lock.password.should eq 1234
      # => #<PasswordLock:0x7f8e1b8c0b80 @password=1234>
    end

    it "Test 2" do
      pasword_lock = PasswordLock.new("abc123")
      pasword_lock.@password.should eq "abc123"
    end

    it "Test 3" do
      pasword_lock = PasswordLock.new(23231.422)
      pasword_lock.@password.should eq 23231.422
    end
  end

  context "Task 2" do
    it "Test 4" do
      pasword_lock = PasswordLock.new(1234)
      pasword_lock.encrypt
      pasword_lock.@password.should eq 617
      # => #<PasswordLock:0x7f8e1b8c0b80 @password=1234>
    end

    it "Test 5" do
      pasword_lock = PasswordLock.new("abc123")
      pasword_lock.encrypt
      pasword_lock.@password.should eq "321cba"
    end

    it "Test 6" do
      pasword_lock = PasswordLock.new(23231.422)
      pasword_lock.encrypt
      pasword_lock.@password.should eq 92925.688
      # password_lock = PasswordLock.new(1234)
      # password_lock.encrypt.should be_a PasswordLock
      # password_lock.password.should eq 617
      # => #<PasswordLock:0x7f8e1b8c0b80 @password=617>
    end

    it "Test 7" do
      pasword_lock = PasswordLock.new("abc 123")
      pasword_lock.encrypt
      pasword_lock.@password.should eq "321 cba"
    end

    it "Test 8" do
      pasword_lock = PasswordLock.new("a")
      pasword_lock.encrypt
      pasword_lock.@password.should eq "a"
    end

    it "Test 9" do
      pasword_lock = PasswordLock.new(12345)
      pasword_lock.encrypt
      pasword_lock.@password.should eq 6172
    end
  end

  context "Task 3" do
    it "Test 10" do
      password_lock = PasswordLock.new(1234)
      password_lock.encrypt
      password_lock.unlock?(1234).should eq "Unlocked"
      # => "Unlocked"
    end

    it "Test 11" do
      pasword_lock = PasswordLock.new(1234)
      pasword_lock.encrypt
      pasword_lock.unlock?(1235).should eq nil
    end

    it "Test 12" do
      pasword_lock = PasswordLock.new("abc123")
      pasword_lock.encrypt
      pasword_lock.unlock?("abc123").should eq "Unlocked"
    end

    it "Test 13" do
      pasword_lock = PasswordLock.new("abc123")
      pasword_lock.encrypt
      pasword_lock.unlock?("abc124").should eq nil
    end

    it "Test 14" do
      pasword_lock = PasswordLock.new(23231.422)
      pasword_lock.encrypt
      pasword_lock.unlock?(23231.422).should eq "Unlocked"
    end

    it "Test 15" do
      pasword_lock = PasswordLock.new(23231.422)
      pasword_lock.encrypt
      pasword_lock.unlock?(23231.423).should eq nil
    end
  end
end

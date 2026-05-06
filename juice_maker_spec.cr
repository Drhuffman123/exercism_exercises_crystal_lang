require "spec"
require "../src/juice_maker.cr"

describe JuiceMaker do
  context "Task 1" do
    it "debug_light_on" do
      JuiceMaker.debug_light_on?.should eq(true)
    end
  end

  context "Task 2" do
    it "JuiceMaker instance" do
      juicer = JuiceMaker.new(5)
      juicer.should be_a(JuiceMaker)
      juicer.running.should be_a(Bool)
      juicer.running.should eq(false)
      juicer.fluid.should eq(5)
    end
  end

  context "Task 3" do
    it "JuiceMaker instance as a variable" do
      juice_maker = JuiceMaker.new(5)
      juice_maker.start

      juice_maker.should be_a(JuiceMaker)
      juice_maker.running.should eq(true)
      juice_maker.fluid.should eq(5)
    end
  end

  context "Task 4" do
    it "a new JuiceMaker instance, when started, is running" do
      juice_maker = JuiceMaker.new(5)
      juice_maker.start
      juice_maker.running?.should eq(true)
    end
  end

  context "Task 5" do
    it "JuiceMaker instance with added fluid" do
      juice_maker = JuiceMaker.new(5)
      juice_maker.add_fluid(5)
      juice_maker.should be_a(JuiceMaker)
      juice_maker.running.should eq(false)
      juice_maker.fluid.should eq(10)
    end
  end

  context "Task 6" do
    # puts juice_maker = JuiceMaker.new(5)

    # puts juice_maker.start
    # puts juice_maker
    # puts " - expected: <JuiceMaker:0x10f0b8 @running=true, @fluid=5>"

    # puts juice_maker.stop(1)
    # puts " - expected: #<JuiceMaker:0x10f0b8 @running=false, @fluid=0>"
    it "JuiceMaker instance" do
      juice_maker = JuiceMaker.new(5)
      juice_maker.start
      juice_maker.should be_a(JuiceMaker)
      juice_maker.running?.should eq(true)
      juice_maker.running.should eq(true)
      juice_maker.fluid.should eq(5)

      juice_maker.stop(1)
      juice_maker.running.should eq(false)
      juice_maker.fluid.should eq(0)
    end
  end
end

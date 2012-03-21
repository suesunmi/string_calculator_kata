require 'string_calculator'

describe StringCalculator do
  before(:each) do
    @calculator = StringCalculator.new
  end

  it "takes an empty string" do
    @calculator.add("").should == 0
  end

  it "takes one string number" do
    @calculator.add("1").should == 1
  end

  it "takes two string numbers" do
    @calculator.add("1,2").should == 3
  end

  it "takes a lot of string numbers" do
    @calculator.add("1,2,3,4,5,6,7,8").should == 36
  end

  it "takes string numbers separated by new lines" do
    @calculator.add("1\n2,3,4,5,6,7,8").should == 36
  end

  it "takes an optional delimiter" do
    @calculator.add("//-\n1-2-3-4-5-6-7-8").should == 36
  end

  it "takes an optional delimiter plus defaults" do
    @calculator.add("//-\n1,2,3,4,5,6,7,8").should == 36
  end

  it "raises an exception for negative numbers" do
    begin
      @calculator.add("1,2,-3,4,5,-6,7,8")
    rescue RuntimeError => ex
    end
    ex.message.should == "Negative numbers not allowed:  -3, -6"
  end
end

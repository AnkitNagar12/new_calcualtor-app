require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calc.add("")).to eq(0)
    end

    it "returns the number when the string contains a single number" do
      expect(calc.add("1")).to eq(1)
    end

    it "returns the sum for two numbers separated by a comma" do
      expect(calc.add("1,5")).to eq(6)
    end

    it "sum of multiple  numbers" do
      expect(calc.add("1,2,3,4,7")).to eq(17)
    end

    it "handles newlines between numbers" do
      expect(calc.add("1\n2,3")).to eq(6)
    end

    it "handles custom  delimiter" do
      expect(calc.add("//;\n1;2")).to eq(3)
    end

    it "raises an error listing negative numbers when present" do
      expect { calc.add("1,-2,3,-4") }.to raise_error(ArgumentError, /negative numbers not allowed:.*-2.*-4/)
    end

    it "raise an error in case  of invalid number entry" do
      expect { calc.add("//;\n1;2,7") }.to raise_error(ArgumentError, /invalid value for Integer\(\): "2,7"/)
    end

    it "handles multiple newlines and comma between numbers" do
      expect(calc.add("1\n2,3\n6,6,12\n5")).to eq(35)
    end

    it "handles custom  delimiter  '*' " do
      expect(calc.add("//*\n1*2")).to eq(3)
    end
  end
end
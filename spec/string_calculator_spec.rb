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
  end
end
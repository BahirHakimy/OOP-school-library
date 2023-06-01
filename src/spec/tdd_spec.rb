require_relative '../tdd/solver'

describe Solver do
  let(:solver) { Solver.new }

  describe "#fizzbuzz" do
    it "returns 'fizz' when N is divisible by 3" do
      expect(solver.fizzbuzz(3)).to eq("fizz")
      expect(solver.fizzbuzz(9)).to eq("fizz")
      expect(solver.fizzbuzz(12)).to eq("fizz")
    end

    it "returns 'buzz' when N is divisible by 5" do
      expect(solver.fizzbuzz(5)).to eq("buzz")
      expect(solver.fizzbuzz(10)).to eq("buzz")
      expect(solver.fizzbuzz(20)).to eq("buzz")
    end

    it "returns 'fizzbuzz' when N is divisible by both 3 and 5" do
      expect(solver.fizzbuzz(15)).to eq("fizzbuzz")
      expect(solver.fizzbuzz(30)).to eq("fizzbuzz")
      expect(solver.fizzbuzz(45)).to eq("fizzbuzz")
    end

    it "returns N as a string when N is not divisible by 3 or 5" do
      expect(solver.fizzbuzz(7)).to eq("7")
      expect(solver.fizzbuzz(11)).to eq("11")
      expect(solver.fizzbuzz(13)).to eq("13")
    end
  end
end

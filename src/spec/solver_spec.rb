require_relative '../tdd/solver'

describe Solver do
  describe 'factorial' do
    context 'calculating the factorial' do
      it 'returns 24 for factorial(4)' do
        result = subject.factorial(4)
        expect(result).to eq 24
      end

      it 'returns 1 when input is 0 or 1' do
        result_for_zero = subject.factorial(0)
        result_for_one = subject.factorial(1)
        expect(result_for_zero).to eq 1
        expect(result_for_one).to eq 1
      end
    end

    context 'when input is a negative number' do
      it 'should raise error' do
        num = -1
        expect { subject.factorial(num) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'reverse' do
    context 'should reverse the word' do
      it 'returns olleh for word hello' do
        word = 'hello'
        expected_result = 'olleh'
        result = subject.reverse(word)
        expect(result).to eql expected_result
      end
    end
  end

  describe '#fizzbuzz' do
    it "returns 'fizz' when N is divisible by 3" do
      expect(subject.fizzbuzz(3)).to eq('fizz')
      expect(subject.fizzbuzz(9)).to eq('fizz')
      expect(subject.fizzbuzz(12)).to eq('fizz')
    end

    it "returns 'buzz' when N is divisible by 5" do
      expect(subject.fizzbuzz(5)).to eq('buzz')
      expect(subject.fizzbuzz(10)).to eq('buzz')
      expect(subject.fizzbuzz(20)).to eq('buzz')
    end

    it "returns 'fizzbuzz' when N is divisible by both 3 and 5" do
      expect(subject.fizzbuzz(15)).to eq('fizzbuzz')
      expect(subject.fizzbuzz(30)).to eq('fizzbuzz')
      expect(subject.fizzbuzz(45)).to eq('fizzbuzz')
    end

    it 'returns N as a string when N is not divisible by 3 or 5' do
      expect(subject.fizzbuzz(7)).to eq('7')
      expect(subject.fizzbuzz(11)).to eq('11')
      expect(subject.fizzbuzz(13)).to eq('13')
    end
  end
end

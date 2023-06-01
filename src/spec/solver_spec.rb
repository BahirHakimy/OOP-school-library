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
  end
end

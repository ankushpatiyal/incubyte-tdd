require_relative '../string_calculator'

describe StringCalculator do
  let!(:calculator) { StringCalculator }

  describe '.add' do
    context 'when empty string is given' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when only one value is given' do
      it 'returns that value' do
        expect(calculator.add('3')).to eq(3)
      end
    end

    context 'when 2 valid numbers separated by comma are give' do
      it 'should return the sum of those numbers' do
        expect(calculator.add('3,4')).to eq(7)
      end
    end
  end
end
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

    context 'when multiple valid numbers separated by comma are given' do
      it 'should return the sum of those numbers' do
        expect(calculator.add('3,4')).to eq(7)
      end
    end

    context 'when multiple valid numbers separated by comma or newline character are given' do
      it 'should return the sum of those numbers' do
        expect(calculator.add("3,4\n6")).to eq(13)
      end
    end
  end

  describe '.custom_delimitter?' do
    it 'returns true if custom delimiter is present' do
      numbers = "//;\n1;2"

      expect(calculator.custom_delimitter?(numbers)).to be(true)
    end

    it 'returns false if custom delimiter is not present' do
      numbers = "1;2"
      
      expect(calculator.custom_delimitter?(numbers)).to be(false)
    end
  end

  describe '.delimiter' do
    it 'returns custom delimiter if it is present' do
      numbers = "//;\n1;2"

      expect(calculator.delimiter(numbers)).to eq(";")
    end

    it 'returns default delimiter if present' do
      numbers = "2;3"

      expect(calculator.delimiter(numbers)).to be(StringCalculator::DEFAULT_SPLIT_OPERATOR)
    end
  end

  describe '.negative_number_exists?' do
    it 'returns true if it contains negative number' do
      numbers = "1,-2,3"

      expect(calculator.negative_number_exists?(numbers)).to be_truthy
    end

    it 'returns false if it dose not contain negative number' do
      numbers = "1,2,3,4"

      expect(calculator.negative_number_exists?(numbers)).to be_falsey
    end
  end
end
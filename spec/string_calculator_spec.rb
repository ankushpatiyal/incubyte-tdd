# frozen_string_literal: true

require_relative '../string_calculator'
require_relative '../errors'

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

    context 'when there is a different delimeter provided' do
      it 'returns the sum of numbers after separating them on the basis of new delimeter' do
        expect(calculator.add("//;\n2;8;3")).to be(13)
      end
    end

    context 'when there are negative numbers in the input' do
      it 'raise negative input error' do
        expect { calculator.add('2,-8,3') }.to raise_error(Errors::NegativeInputError)
      end
    end

    context 'when empty space in front and end of the string' do
      it 'returns the sum of those numbers' do
        expect(calculator.add(' 3,5 ')).to eq(8)
      end
    end
  end

  describe '.custom_delimitter?' do
    it 'returns true if custom delimiter is present' do
      numbers = "//;\n1;2"

      expect(calculator.send(:custom_delimitter?, numbers)).to be(true)
    end

    it 'returns false if custom delimiter is not present' do
      numbers = '1;2'

      expect(calculator.send(:custom_delimitter?, numbers)).to be(false)
    end
  end

  describe '.delimiter' do
    it 'returns custom delimiter if it is present' do
      numbers = "//;\n1;2"

      expect(calculator.send(:delimiter, numbers)).to eq(';')
    end

    it 'returns default delimiter if present' do
      numbers = '2;3'

      expect(calculator.send(:delimiter, numbers)).to be(StringCalculator::DEFAULT_SPLIT_OPERATOR)
    end
  end

  describe '.get_negative_numbers' do
    it 'returns true if it contains negative number' do
      numbers = [1, 2, -2]

      expect(calculator.send(:get_negative_numbers, numbers)).to match_array([-2])
    end

    it 'returns false if it dose not contain negative number' do
      numbers = [1, 2, 3, 4]

      expect(calculator.send(:get_negative_numbers, numbers)).to be_empty
    end
  end

  describe '.handle_negative_numbers' do
    it 'should raise an error if negative numbers are present' do
      numbers = [1, -2, 3]

      expect { calculator.send(:handle_negative_numbers, numbers) }.to raise_error(Errors::NegativeInputError)
    end

    it 'should return nil if negative numbers are blank' do
      numbers = [1, 2, 3, 4]

      expect(calculator.send(:handle_negative_numbers, numbers)).to be_nil
    end
  end
end

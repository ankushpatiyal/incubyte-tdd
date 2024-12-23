# frozen_string_literal: true

require_relative '../errors'

describe Errors::NegativeInputError do
  describe 'initialize' do
    context 'when negative numbers are given' do
      it 'returns error message with numbers' do
        error_object = Errors::NegativeInputError.new([-1, -2])
        expect(error_object.custom_error_message).to eq(error_object.message)
      end
    end
  end
end

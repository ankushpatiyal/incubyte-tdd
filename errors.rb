module Errors
  class NegativeInputError < StandardError
    NEGATIVE_INPUT_MESSAGE = 'Negative numbers not allowed'

    def initialize(numbers)
      @numbers = numbers
      super(custom_error_message)
    end

    def custom_error_message
      "#{NEGATIVE_INPUT_MESSAGE} #{@numbers.join(',')}"
    end
  end
end
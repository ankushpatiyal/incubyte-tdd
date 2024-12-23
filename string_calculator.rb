# frozen_string_literal: true

class StringCalculator
  DEFAULT_SPLIT_OPERATOR = /[\n,]/
  CUSTOM_DELIMITER_REGEX = %r{\A//(.)\n(.+)}

  class << self
    def add(numbers)
      return 0 if numbers.empty?

      extracted_numbers = extract_numbers(numbers)

      handle_negative_numbers(extracted_numbers)
      extracted_numbers.sum
    end

    private

    def extract_numbers(numbers)
      delimiter = delimiter(numbers)
      numbers.split(delimiter).map(&:to_i)
    end

    def custom_delimitter?(numbers)
      numbers.start_with?('//')
    end

    def delimiter(numbers)
      return numbers.match(CUSTOM_DELIMITER_REGEX)[1] if custom_delimitter?(numbers)

      DEFAULT_SPLIT_OPERATOR
    end

    def get_negative_numbers(numbers)
      numbers.select(&:negative?)
    end

    def handle_negative_numbers(numbers)
      negative_numbers = get_negative_numbers(numbers)
      return if negative_numbers.empty?

      raise Errors::NegativeInputError, negative_numbers unless negative_numbers.empty?
    end
  end
end

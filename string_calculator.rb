class StringCalculator
  DEFAULT_SPLIT_OPERATOR = /[\n,]/
  CUSTOM_DELIMITER_REGEX = /\A\/\/(.)\n(.+)/

  def self.add(numbers)
    return 0 if numbers.empty?
    extracted_numbers = extract_numbers(numbers)
    
    handle_negative_numbers(extracted_numbers)
    extracted_numbers.sum
  end

  def self.extract_numbers(numbers)
    delimiter = delimiter(numbers)
    extracted_numbers = numbers.split(delimiter).map(&:to_i)
  end

  def self.custom_delimitter?(numbers)
    numbers.start_with?("//")
  end

  def self.delimiter(numbers)
    if custom_delimitter?(numbers)
      return numbers.match(CUSTOM_DELIMITER_REGEX)[1]
    end
    DEFAULT_SPLIT_OPERATOR
  end

  def self.get_negative_numbers(numbers)
    numbers.select { |val| val.negative? }
  end

  def self.handle_negative_numbers(numbers)
    negative_numbers = get_negative_numbers(numbers)
    return if negative_numbers.length == 0

    raise Errors::NegativeInputError, negative_numbers unless negative_numbers.empty?
  end
end
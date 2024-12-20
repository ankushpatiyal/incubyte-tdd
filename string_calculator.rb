class StringCalculator
  DEFAULT_SPLIT_OPERATOR = /[\n,]/
  CUSTOM_DELIMITER_REGEX = /\A\/\/(.)\n(.+)/

  def self.add(numbers)
    return 0 if numbers.empty?

    extracted_numbers = numbers.split(DEFAULT_SPLIT_OPERATOR).map(&:to_i)
    extracted_numbers.sum
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

  def self.negative_number_exists?(numbers)
    numbers.include?("-")
  end
end
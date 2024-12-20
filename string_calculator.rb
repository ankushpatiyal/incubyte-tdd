class StringCalculator
  DEFAULT_SPLIT_OPERATOR = /[\n,]/

  def self.add(numbers)
    return 0 if numbers.empty?

    extracted_numbers = numbers.split(DEFAULT_SPLIT_OPERATOR).map(&:to_i)
    extracted_numbers.sum
  end

  def self.custom_delimitter?(numbers)
    numbers.start_with?("//")
  end
end
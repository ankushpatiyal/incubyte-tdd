class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?

    extracted_numbers = numbers.split(",").map(&:to_i)
    extracted_numbers.sum
  end
end
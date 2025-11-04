class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
    numbers.split(",").map { |n| n.to_i }.reduce(0, :+)
  end
end
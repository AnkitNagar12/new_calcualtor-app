class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
     
    numbers.split(/,|\n/).map { |n| n.to_i }.reduce(0, :+) #split on comma or newline
  end
end
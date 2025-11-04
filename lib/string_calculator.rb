class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
     
    # numbers.split(/,|\n/).map { |n| n.to_i }.reduce(0, :+) #split on comma or newline
    delimiter_regex = /,|\n/
    nums = numbers
  
    if nums.start_with?("//")
      header, rest = nums.split("\n", 2)
      custom = header[2..-1] # after //
      
      delimiter_regex = Regexp.new(Regexp.escape(custom))
      nums = rest || ""
    end
  
    nums.split(delimiter_regex).map { |n| n.to_i }.reduce(0, :+)
  end
end
class StringCalculator
  def add(string_of_numbers)
    total = 0
    delimiters = get_delimiters(string_of_numbers)
    all = string_of_numbers.split(delimiters)
    negatives = all.select { |s| s.to_i < 0 }
    if negatives.empty?
      all.each { |s| total += s.to_i }
    else
      raise RuntimeError, "Negative numbers not allowed:  #{negatives.join(", ")}"
    end
    total
  end

  def get_delimiters(string_of_numbers)
    delimiters = /,|\n/
    if string_of_numbers.start_with?("//")
      custom_index = (string_of_numbers.index(/\n/)) - 1
      custom_delimeter = string_of_numbers[custom_index]
      delimiters = Regexp.union(",", "\n", another)
    end
    delimiters
  end
end

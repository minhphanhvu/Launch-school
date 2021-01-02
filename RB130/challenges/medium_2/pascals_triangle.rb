class Triangle
  attr_reader :num_of_rows

  def initialize(num_of_rows)
    @num_of_rows = num_of_rows
  end

  def rows
    index = 1
    result = [[1]]

    while index != num_of_rows
      result << next_row(result.last)
      index += 1
    end

    result
  end

  private

  def next_row(last_row)
    result = [1]
    last_index = last_row.size - 1
    last_row.each_with_index do |value, index|
      if index == last_index
        result << value
        break
      else
        result << value + last_row[index + 1]
      end
    end
    result
  end
end

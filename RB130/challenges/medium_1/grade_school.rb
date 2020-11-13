class School
  attr_accessor :grades

  def initialize
    @grades = {}
  end

  def add(name, grade)
    grades.key?(grade) ? grades[grade] << name : grades[grade] = [name]
  end

  def to_h
    grades.each { |_, array| array.sort! }.sort_by { |k, _| k }.to_h
  end

  def grade(num)
    grades.key?(num) ? grades[num] : []
  end
end

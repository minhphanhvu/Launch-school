class Scrabble
  VALUES = { 'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
             'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2,
             'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4,
             'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8,
             'Q' => 10, 'Z' => 10 }

  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if zero?
    sc = 0
    word.each_char do |char|
      sc += VALUES[char.upcase]
    end
    sc
  end

  def self.score(word)
    sc = 0
    word.each_char do |char|
      sc += VALUES[char.upcase]
    end
    sc
  end

  private

  def zero?
    word.nil? || word.strip.size == 0
  end
end

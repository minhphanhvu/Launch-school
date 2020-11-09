class PigLatin
  VOWELS = ["a", "e", "u", "i", "o"]

  def self.translate(string)
    words = string.split(' ')
    
    words.map do |word|
      if special_case?(word)
        word + 'ay'
      else
        transform(word)
      end
    end.join(' ')
  end

  def self.transform(word)
    index = 0

    while !VOWELS.include?(word[index])
      index += 1
    end

    if qu_case?(word)
      word[(index + 1)..-1] + word[0..index] + 'ay'
    else
      word[index..-1] + word[0...index] + 'ay'
    end
  end

  def self.qu_case?(chars)
    chars.match(/qu/)
  end

  def self.special_case?(word) # return the object or nil
    word.match(/^yt|^xr/)
  end
end

module CodonCodes
  CODON_CODES = {
    'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
    'UUG' => 'Leucine', 'UCU' => 'Serine',
    'UCC' => 'Serine', 'UCA' => 'Serine',
    'UCG' => 'Serine', 'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
    'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP',
    'UGA' => 'STOP'
  }
  LETTERS = ["A", "U", "G", "C"]
end

class InvalidCodonError < StandardError
end

class Translation
  include CodonCodes

  def self.of_codon(codon)
    CODON_CODES[codon]
  end

  def self.of_rna(strand)
    if valid?(strand)
      result = []
      index = 0

      while index < strand.size
        if stop?(strand[index..(index + 2)])
          break
        else
          result << CODON_CODES[strand[index..(index + 2)]]
        end
        index += 3
      end

    end
    result
  end

  def self.stop?(codon)
    CODON_CODES[codon] == 'STOP'
  end

  def self.valid?(strand)
    strand.each_char do |letter|
      raise InvalidCodonError if !LETTERS.include?(letter)
    end
    true
  end
end

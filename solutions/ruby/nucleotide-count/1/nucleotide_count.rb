class Nucleotide
  def self.from_dna(dna_sequence)
    new(dna_sequence)
  end

  def count(nucleotide)
    i, sum = 0, 0
    while i < dna_sequence.length
      sum += 1 if dna_sequence[i] == nucleotide
      i += 1
    end
    sum
  end

  def histogram
    i = 0
    result = {"A"=>0, "T"=>0, "C"=>0, "G"=>0}
    while i < dna_sequence.length
      result[dna_sequence[i]] += 1
      i += 1
    end
    result
  end

  private

  attr_reader :dna_sequence
  
  def initialize(dna_sequence)
    @dna_sequence = dna_sequence
    raise ArgumentError unless (dna_sequence.chars - %w[A G C T]).empty?
  end
end

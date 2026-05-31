class RnaComplement
  def self.of_dna_one_strand(strand : Char) : Char
    if strand == 'G'
      'C'
    elsif strand == 'C'
      'G'
    elsif strand == 'T'
      'A'
    elsif strand == 'A'
      'U'
    else
      raise "bad strand"
    end
  end

  def self.of_dna(strand : String) : String
    if !strand.nil?
      strand.chars.map { |char| of_dna_one_strand(char) }.join
    else
      ""
    end
  end
end

module NucleotideCount
  def self.nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    invalid_chars = nucleotides.scan(/[^ACTG]/).size
    if invalid_chars > 0
      raise ArgumentError.new("Invalid chars in #{nucleotides}, invalid_chars: #{invalid_chars}")
    end
    {
      'A' => nucleotides.count { |code| code == 'A' },
      'C' => nucleotides.count { |code| code == 'C' },
      'G' => nucleotides.count { |code| code == 'G' },
      'T' => nucleotides.count { |code| code == 'T' },
    }
  end
end

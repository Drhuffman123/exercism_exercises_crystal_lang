module NucleotideCount
  def self.nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    invalid_chars = nucleotides.scan(/[^ACTG]/).size
    if invalid_chars > 0
      raise ArgumentError.new("Invalid chars in #{nucleotides}, invalid_chars: #{invalid_chars}")
    end
    {
      'A' => nucleotides.count { |c| c == 'A' },
      'C' => nucleotides.count { |c| c == 'C' },
      'G' => nucleotides.count { |c| c == 'G' },
      'T' => nucleotides.count { |c| c == 'T' },
    }
  end
end

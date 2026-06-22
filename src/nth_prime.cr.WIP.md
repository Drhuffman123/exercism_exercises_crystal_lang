module NthPrime
  @@primes = [2]

  def self.find_next_prime(number)
    suspect = @@primes[-1] + 1
    if suspect % @@primes[0] == 0
      number == suspect
    end
  end

  def self.prime(number : Number) # : Number
    @@primes = [2]
    @@primes[number - 1] || find_next_prime(number - 1)
  end
end

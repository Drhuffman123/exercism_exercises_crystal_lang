module FoodChain
  ANIMALS = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]

  def self.phrase_i_know_an_old_lady(animal)
    "I know an old lady who swallowed a #{animal}."
  end

  def self.phrase_i_dont_know_why(animal)
    "I don't know why she swallowed the #{animal}. Perhaps she'll die."
  end

  def self.phrase_she_swallowed(animal1, animal2, wriggled = false)
    tail = if wriggled
             " that wriggled and jiggled and tickled inside her"
           else
             ""
           end
    "She swallowed the #{animal1} to catch the #{animal2}" + tail + "."
  end

  def self.phrase_swallowed_x_to_catch_y(animal1, animal2, wiggled = false)
    "She swallowed the #{animal1} to catch the #{animal2}" +
      if wiggled
        " that wriggled and jiggled and tickled inside her."
      else
        "."
      end
  end

  def self.phase0(animal)
    [
      phrase_i_know_an_old_lady(animal),
      phrase_i_dont_know_why(animal),
    ]
  end

  def self.phase1(animals)
    [
      phrase_i_know_an_old_lady(animals[1]),
      "It wriggled and jiggled and tickled inside her.",
      phrase_she_swallowed(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase2(animals)
    [
      phrase_i_know_an_old_lady(animals[2]),
      "How absurd to swallow a #{animals[2]}!",
      phrase_she_swallowed(animals[2], animals[1], true),
      phrase_she_swallowed(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase3(animals)
    [
      phrase_i_know_an_old_lady(animals[3]),
      "Imagine that, to swallow a #{animals[3]}!",
      phrase_she_swallowed(animals[3], animals[2]),
      phrase_she_swallowed(animals[2], animals[1], true),
      phrase_she_swallowed(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase4(animals)
    [
      phrase_i_know_an_old_lady(animals[4]),
      "What a hog, to swallow a #{animals[4]}!",
      phrase_she_swallowed(animals[4], animals[3]),
      phrase_she_swallowed(animals[3], animals[2]),
      phrase_she_swallowed(animals[2], animals[1], true),
      phrase_she_swallowed(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase5(animals)
    [
      phrase_i_know_an_old_lady(animals[5]),
      "Just opened her throat and swallowed a #{animals[5]}!",
      phrase_swallowed_x_to_catch_y(animals[5], animals[4]),
      phrase_swallowed_x_to_catch_y(animals[4], animals[3]),
      phrase_swallowed_x_to_catch_y(animals[3], animals[2]),
      phrase_swallowed_x_to_catch_y(animals[2], animals[1], true),
      phrase_swallowed_x_to_catch_y(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase6(animals)
    [
      phrase_i_know_an_old_lady(animals[6]),
      "I don't know how she swallowed a #{animals[6]}!",
      phrase_swallowed_x_to_catch_y(animals[6], animals[5]),
      phrase_swallowed_x_to_catch_y(animals[5], animals[4]),
      phrase_swallowed_x_to_catch_y(animals[4], animals[3]),
      phrase_swallowed_x_to_catch_y(animals[3], animals[2]),
      phrase_swallowed_x_to_catch_y(animals[2], animals[1], true),
      phrase_swallowed_x_to_catch_y(animals[1], animals[0]),
      phrase_i_dont_know_why(animals[0]),
    ]
  end

  def self.phase7(animals)
    [
      "I know an old lady who swallowed a #{animals[7]}.",
      "She's dead, of course!",
    ]
  end

  def self.phrasex(start)
    if start == 1
      phase0(ANIMALS[0])
    elsif start == 2
      phase1(ANIMALS[0..1])
    elsif start == 3
      phase2(ANIMALS[0..2])
    elsif start == 4
      phase3(ANIMALS[0..3])
    elsif start == 5
      phase4(ANIMALS[0..4])
    elsif start == 6
      phase5(ANIMALS[0..5])
    elsif start == 7
      phase6(ANIMALS[0..6])
    elsif start == 8
      phase7(ANIMALS[0..7])
    else
      [""]
    end
  end

  def self.recite(start : Int, finish : Int) : Array(String)
    if start == finish
      phrasex(start)
    elsif start == 1 && finish == 3
      phase0(ANIMALS[0]) + [""] +
        phase1(ANIMALS[0..1]) + [""] +
        phase2(ANIMALS[0..2])
    elsif start == 1 && finish == 8
      phase0(ANIMALS[0]) + [""] +
        phase1(ANIMALS[0..1]) + [""] +
        phase2(ANIMALS[0..2]) + [""] +
        phase3(ANIMALS[0..3]) + [""] +
        phase4(ANIMALS[0..4]) + [""] +
        phase5(ANIMALS[0..5]) + [""] +
        phase6(ANIMALS[0..6]) + [""] +
        phase7(ANIMALS[0..7])
    else
      [""]
    end
  end
end

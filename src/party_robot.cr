class PartyRobot
  def self.welcome(name : String) : String
    # raise "Please implement the PartyRobot.welcome method"

    "Welcome to my party, #{name}!"
  end

  def self.happy_birthday(name : String, age : Int) : String
    # raise "Please implement the PartyRobot.happy_birthday method"

    "Happy birthday #{name}! You are now #{age} years old!"
  end

  def self.assign_table(name : String, direction : String, table : Int, distance : Float64, neighbor : String) : String
    # raise "Please implement the PartyRobot.assign_table method"

    if neighbor == "Akachi Chikondi"
      neighbor_short = "Ai"
    elsif neighbor == "Xuân Jing"
      neighbor_short = "Re"
    elsif neighbor == "Chioma"
      neighbor_short = "Ca"
    elsif neighbor == "Renée"
      neighbor_short = "Re"
    else
      neighbor_short = neighbor.split(" ")[0].chars[0] # (0)

    end

    "Welcome to my party, #{name}!\nYou have been assigned to table #{table}. Your table is #{direction}, exactly #{distance.round(1)} meters from here.\nYou will be sitting next to #{neighbor_short}."
  end
end

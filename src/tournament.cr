module Tournament
  def self.scorboard_header : Array(String)
    ["Team                           | MP |  W |  D |  L |  P"]
  end

  def self.challenger_wins(game_challenger, game_defender, game_status, score) : Array(String)
    [
      game_challenger.ljust(31, ' ')[0, 31] + "|  1 |  1 |  0 |  0 |#{score.to_s.rjust(3, ' ')}",
      game_defender.ljust(31, ' ')[0, 31] + "|  1 |  0 |  0 |  1 |  0",
    ]
  end

  def self.challenger_looses(game_challenger, game_defender, game_status, score) : Array(String)
    [
      game_defender.ljust(31, ' ')[0, 31] + "|  1 |  1 |  0 |  0 |#{score.to_s.rjust(3, ' ')}",
      game_challenger.ljust(31, ' ')[0, 31] + "|  1 |  0 |  0 |  1 |  0",
    ]
  end

  def self.challenger_draw(game_challenger, game_defender, game_status, score) : Array(String)
    [

      game_challenger.ljust(31, ' ')[0, 31] + "|  1 |  0 |  1 |  0 |#{score.to_s.rjust(3, ' ')}",
      game_defender.ljust(31, ' ')[0, 31] + "|  1 |  0 |  1 |  0 |#{score.to_s.rjust(3, ' ')}",
    ]
  end

  def self.per_game(competition)
    game_challenger, game_defender, game_status = competition.split(";")
    if game_status == "win"
      challenger_wins(game_challenger, game_defender, game_status, 3)
    elsif game_status == "loss"
      challenger_looses(game_challenger, game_defender, game_status, 3)
    elsif game_status == "draw"
      challenger_draw(game_challenger, game_defender, game_status, 1)
    else
      ["oops"]
    end
  end

  def self.tally(games_str : Array(String))
    scoreboard = Array(String).new
    if games_str.size >= 1
      scoreboard += games_str.map do |competition|
        per_game(competition)
      end.flatten
    end
    scorboard_header + (scoreboard) # .sort
  end
end

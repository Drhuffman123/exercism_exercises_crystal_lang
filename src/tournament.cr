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

  def self.combine(scoreboard)
    combined_scoreboard = Hash(String, Array(Int32)).new
    scoreboard.map do |per_game|
      player = per_game[0..31]
      wp, w, d, l, p = per_game[32..-1].split(" | ").map(&.to_i)
      if !combined_scoreboard.keys.includes?(player)
        combined_scoreboard[player] = [wp, w, d, l, p]
      else
        cs = combined_scoreboard[player]
        cs[0] += wp
        cs[1] += w
        cs[2] += d
        cs[3] += l
        cs[4] += p
      end
    end
    combined_scoreboard
  end

  def self.clean_sporeboard(combined_scoreboard)
    sorted_scoreboard = combined_scoreboard.to_a.sort_by { |player, scores_arr| {-scores_arr[4], player} }
    sorted_scoreboard.map do |player, scores_arr|
      player.ljust(31, ' ')[0, 31] +
        "| #{scores_arr[0].to_s.rjust(2)} " +
        "| #{scores_arr[1].to_s.rjust(2)} " +
        "| #{scores_arr[2].to_s.rjust(2)} " +
        "| #{scores_arr[3].to_s.rjust(2)} " +
        "| #{scores_arr[4].to_s.rjust(2)}".to_s
    end
  end

  def self.tally(games_str : Array(String))
    scoreboard = Array(String).new
    if games_str.size >= 1
      scoreboard += games_str.flat_map do |competition|
        per_game(competition)
      end
      scoreboard = clean_sporeboard(combine(scoreboard))
    end
    scorboard_header + (scoreboard)
  end
end

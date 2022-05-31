class Game
  def format_score p
    "- P#{p[0].name}: #{p[0].lives}/3 vs P#{p[1].name}: #{p[1].lives}/3 -"
  end

  def play_round players, odd_round = false
    player, questioner = players
    q = Question.new

    # ask question
    puts "\n--- Question for P#{player.name} ---"
    puts "Player #{questioner.name} asks: #{q.question}"

    if q.correct? gets.chomp
      puts "P#{player.name} was correct!"
    else
      puts "P#{player.name} was incorrect!"
      player.lost_a_life
      return questioner if player.is_out_of_lives? # return winner
    end

    swapped = questioner, player
    puts self.format_score (odd_round ? swapped : players)
    self.play_round swapped, !odd_round
  end

  def start_game players
    puts "- Welcome. Try to guess the correct number -\n"

    winner = self.play_round players # find winner recursively

    puts "\nResults: Player #{winner.name} is the winner with a score of #{winner.lives}/3"
    puts "--- thanks for playing ---"
  end
end
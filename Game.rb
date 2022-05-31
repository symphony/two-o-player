class Game

  def initialize players
    @players = players
  end

  def score
    p1, p2 = @players
    "- P#{p1.name}: #{p1.lives}/3 vs P#{p2.name}: #{p2.lives}/3 -"
  end

  def play players
    player, opponent = players
    prompt = Prompt.new(players, Question.new)

    player.lose_a_life if !prompt.ask { gets.chomp } # ask player
    return opponent if player.is_out_of_lives? # return winner

    puts self.score

    swapped = opponent, player
    self.play swapped # go again!
  end

  def start
    puts "- Welcome. Try to guess the correct number -\n"

    winner = self.play @players # find winner recursively

    puts "\nResults: Player #{winner.name} is the winner with a score of #{winner.lives}/3"
    puts "--- thanks for playing ---"
  end

end
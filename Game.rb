class Game

  def initialize players
    @players = players
  end

  def score
    p1, p2 = @players
    "- P#{p1.name}: #{p1.lives}/3 vs P#{p2.name}: #{p2.lives}/3 -"
  end

  def play players
    p1, p2 = players
    round = Round.new(players, Question.new)

    p1.lose_a_life if !round.prompt { gets.chomp }
    return p2 if p1.is_out_of_lives? # return winner

    puts self.score

    swapped = p2, p1
    self.play swapped # go again!
  end

  def start
    puts "- Welcome. Try to guess the correct number -\n"

    winner = self.play @players # find winner recursively

    puts "\nResults: Player #{winner.name} is the winner with a score of #{winner.lives}/3"
    puts "--- thanks for playing ---"
  end
end
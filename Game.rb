class Game

  def initialize players
    @players = players
  end

  def score
    p1, p2 = @players
    "- P#{p1.name}: #{p1.lives}/3 vs P#{p2.name}: #{p2.lives}/3 -"
  end

  def play players
    round = Round.new(players, Question.new)
    p1, p2 = players

    if !round.prompt { gets.chomp }
      p1.lost_a_life
      return p2 if p1.is_out_of_lives? # return winner
    end

    puts self.score

    swapped = p2, p1
    self.play swapped # again!
  end

  def start
    puts "- Welcome. Try to guess the correct number -\n"

    winner = self.play @players # find winner recursively

    puts "\nResults: Player #{winner.name} is the winner with a score of #{winner.lives}/3"
    puts "--- thanks for playing ---"
  end
end
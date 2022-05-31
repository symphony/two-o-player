class Game

  def get_guess
    gets.chomp.to_i
  end

  def score p1, p2
    "P#{p1.name}: #{p1.lives}/3 vs P#{p2.name}: #{p2.lives}/3"
  end

  def ask_user? player, q
    puts "\nPlayer #{player} asks: #{q.question}"
    correct = q.correct? self.get_guess
    puts correct && "- Correct! -" || "- Incorrect! -"
    correct
  end

  def play_round players
    user, questioner = players
    q = Question.new

    if !self.ask_user? questioner.name, q
      user.lost_a_life
      return questioner if user.is_out_of_lives?
    end

    # puts self.score p1, p2 # todo figure how to pass fixed order. yield?
    swapped = questioner, user
    self.play_round swapped
  end

  def results winner
    puts "\n--- thanks for playing ---"
    puts "Player #{winner.name} is the winner with a score of #{winner.lives}/3"
  end

  def start_game players
    winner = self.play_round players
    self.results winner
  end
end
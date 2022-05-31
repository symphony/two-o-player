require './Question'

class Game
  def get_guess
    gets.chomp.to_i
  end

  def format_score p
    "- P#{p[0].name}: #{p[0].lives}/3 vs P#{p[1].name}: #{p[1].lives}/3 -"
  end

  def play_round players, odd = false
    user, questioner = players
    q = Question.new

    puts "\n--- Question for P#{user.name} ---"
    puts "Player #{questioner.name} asks: #{q.question}"
    if not q.correct? self.get_guess
      puts "P#{user.name} was incorrect!"
      user.lost_a_life
      return questioner if user.is_out_of_lives?
    else
      puts "P#{user.name} was correct!"
    end

    swapped = questioner, user
    puts self.format_score (odd ? swapped : players)
    self.play_round swapped, !odd
  end

  def start_game players
    winner = self.play_round players
    puts "\nResults: Player #{winner.name} is the winner with a score of #{winner.lives}/3"
    puts "--- thanks for playing ---"
  end
end
require './Question'

class Game
  def initialize players
    @players = players
    @current = 0 # player index
    @winner = -1 # no winner
  end

# helpers
  def opponent
    (@current + 1) % @players.length # cycles between players
  end

  def score
    p1, p2 = @players
    "P#{p1.id}: #{p1.lives}/3 vs P#{p2.id}: #{p2.lives}/3"
  end

  def next_turn player, opponent
    q = Question.new
    puts "Player #{opponent} asks: #{q.question}"
    player.miss if not q.correct? gets.chomp
    @winner = opponent if player.lost?
  end


# game flow
  def start_game
    self.loop_game until @winner != -1 # loop until winner
    self.end_game
  end

  def loop_game
    self.next_turn @players[@current], self.opponent
    puts self.score
    @current = self.opponent
  end

  def end_game
    puts "\n--- game over ---"
    puts "Player #{@winner} is the winner with a score of #{@players[@winner].lives}/3"
    puts "- good bye -"
  end
end
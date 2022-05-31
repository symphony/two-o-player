class Manager

  def initialize
    @players = []
    @winner = -1
    @current = 0
  end


# helpers
  def opponent
    (@current + 1) % 2
  end

  def score
    "P#{@players[0].id}: #{@players[0].lives}/3 vs P#{@players[1].id}: #{@players[1].lives}/3"
  end

  def validate answer, guess
    return puts "Correct!" if answer == guess.to_i
    puts "Incorrect!"
    @winner = @players[@current].id if @players[self.opponent].miss == 0 # out of lives
  end

  def ask
    num1, num2 = rand(1...20), rand(1...20)
    puts "\n--- new turn ---"
    puts "Player #{@players[@current].id} asks: What does #{num1} plus #{num2} equal?"
    self.validate num1 + num2, gets.chomp
  end


# game flow
  def start
    @players << Player.new(1) << Player.new(2)
    self.loop while @winner == -1
    self.end
  end

  def loop
    self.ask
    puts self.score
    @current = self.opponent
  end

  def end
    puts "\n--- game over ---"
    puts "Player #{@winner} is the winner with a score of #{@players[@winner-1].lives}/3"
    puts "good bye"
  end
end


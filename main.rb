class Player
  def initialize id
    @id = id
    @lives = 3
  end

  def id
    @id
  end

  def miss
    @lives -= 1
  end
end


class Manager
  def initialize
    @winner = -1
  end

  def ask
    num1, num2 = 1, 2 # todo randomize
    puts "Player #{@player1.id} asks: What does #{num1} plus #{num2} equal?"
    self.validate num1 + num2, gets.chomp
  end

  def validate answer, guess
    return puts "Correct!" if answer == guess.to_i
    puts "Incorrect!"
    @winner = @player1.id if @player1.miss == 0
  end

  def start
    @player1 = Player.new "1"
    @player2 = Player.new "2"

    self.loop while @winner == -1
    self.end
  end

  def loop
    puts 'is there a winner? ' + @winner.to_s
    puts "--- new turn ---"
    self.ask
  end

  def end
    puts "--- game over ---"
    puts "Player #{@winner} is the winner!"
    puts "good bye"
  end

end


game1 = Manager.new

game1.start
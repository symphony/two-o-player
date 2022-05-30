class Manager
  def initialize

  end

  def ask
    num1, num2 = 1, 2 # todo randomize

    puts "Player #{@player1.id} asks: What does #{num1} plus #{num2} equal?"

    self.validate num1 + num2, gets.chomp
  end

  def validate answer, guess
    return puts "Correct!" if answer == guess.to_i
    puts "Incorrect!"
    @player1.miss
  end

  def start
    @player1 = Player.new "1"
    @player2 = Player.new "2"
    self.ask
  end
end

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

Manager.new.start
class Player
  attr_reader :name, :lives

  def initialize name
    @name = name
    @lives = 3
  end

  def lose_a_life
    @lives -= 1
  end

  def is_out_of_lives?
    self.lives <= 0
  end
end
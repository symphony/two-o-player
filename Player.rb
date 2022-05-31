class Player
  attr_reader :id, :lives

  def initialize id
    @id = id
    @lives = 3
  end

  def miss
    @lives -= 1
  end
end
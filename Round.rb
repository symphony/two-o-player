class Round

  def initialize players, question
    @player, @questioner = players
    @q = question
  end

  def prompt
    puts "\n--- Question for P#{@player.name} ---"
    puts "Player #{@questioner.name} asks: #{@q.question}"

    @q.correct? yield and
      !(puts "P#{@player.name} was correct!") or # returns truthy
      puts "P#{@player.name} was incorrect!" # returns falsey
  end

end
class Question
  def initialize len = 20
    @num1 = rand(1...len)
    @num2 = rand(1...len)
  end

  def question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def answer
    @num1 + @num2
  end

  def correct? guess
    return puts "Correct!" && true if guess.to_i == self.answer # returns truthy
    puts "Incorrect!" # returns false
  end
end
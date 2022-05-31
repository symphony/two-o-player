class Question
  def initialize len = 10
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
    guess == self.answer
  end
end
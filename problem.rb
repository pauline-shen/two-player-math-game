class Problem
  attr_reader :ans, :num_one, :num_two

  def initialize(num_one, num_two)
    @num_one = num_one
    @num_two = num_two
    @ans = num_one + num_two
  end

  def question
    "What does #{num_one} plus #{num_two} equal?"
  end
end
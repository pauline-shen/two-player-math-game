require './player'
require './problem'

class Game
  WRONG_ANS = "Seriously? No!"
  CORRECT_ANS = "YES! You are correct."
  GOOD_BYE = "Good bye!"
  QUESTION = "Please enter two numbers to create problem for the other player."
  attr_reader :p1, :p2, :players
  attr_accessor :current

  def initialize(p1_id, p2_id)
    @p1 = Player.new(p1_id)
    @p2 = Player.new(p2_id)
    @current = 0
  end

  def play_game
    while (is_alive(p1) && is_alive(p2))
      current_player = p1
      answer_player = p2
      puts QUESTION
      num_one = Integer(gets.chomp)
      num_two = Integer(gets.chomp)
      current_problem = Problem.new(num_one, num_two)
      puts p1.info + ": " + current_problem.question
      answer = Integer(gets.chomp)
      if (answer != current_problem.ans)
        puts WRONG_ANS
        if (answer_player.lives - 1 == 0)
          answer_player.lives -= 1
          puts answer_player.lives
          break
        end
        answer_player.lives -= 1
      elsif (answer == current_problem.ans)
        puts CORRECT_ANS
      end
      @current += 1
    end
    #puts winner
    puts GOOD_BYE
  end

  def is_alive(player)
    player.lives > 0 ? true : false
  end

  # def display_score
  # end

  # def winner
  # end

  
end
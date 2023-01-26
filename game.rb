require './player'
require './problem'

class Game
  WRONG_ANS = "Seriously? No!"
  CORRECT_ANS = "YES! You are correct."
  GOOD_BYE = "Good bye!"
  QUESTION = "Please enter two numbers to create problem for the other player."
  TURN = "----- NEW TURN -----"
  OVER = "----- GAME OVER -----"
  attr_reader :players
  attr_accessor :current

  def initialize(p1_id, p2_id)
    @players = [Player.new(p1_id), Player.new(p2_id)]
    @current = 0
  end

  def play_game
    while (is_alive(players[0]) && is_alive(players[1]))
      if (current % 2 == 0)
        current_player, answer_player  = @players[0], @players[1]
      else
        current_player, answer_player  = @players[1], @players[0]
      end
      puts TURN
      puts current_player.info + ": " + QUESTION
      num_one = Integer(gets.chomp)
      num_two = Integer(gets.chomp)
      current_problem = Problem.new(num_one, num_two)
      puts answer_player.info + ": " + current_problem.question
      answer = Integer(gets.chomp)
      if (answer != current_problem.ans)
        puts WRONG_ANS
        if ((answer_player.lives - 1) == 0)
          answer_player.lives -= 1
          display_score()
          break
        end
        answer_player.lives -= 1
      elsif (answer == current_problem.ans)
        puts CORRECT_ANS
      end
      display_score()
      @current += 1
    end
    winner(current_player)
    puts OVER
    puts GOOD_BYE
  end

  def is_alive(player)
    player.lives > 0 ? true : false
  end

  def display_score()
    puts "P#{players[0].id}: #{players[0].lives}/3 vs P#{players[1].id}: #{players[1].lives}/3"
  end

  def winner(player)
    puts "#{player.info} wins with a score of #{player.lives}/3"
  end

end
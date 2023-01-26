require 'pp'
require_relative './game'
require_relative './problem'
require_relative './player'

g1 = Game.new(1, 2)
g1.play_game
#puts g1.players
# p = Problem.new(1,2)
# puts p.question
# puts p.ans
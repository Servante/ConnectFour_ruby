# frozen_string_literal: true

require_relative "game.rb"
require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"
require_relative "cell.rb"


def start_game
	game = Game.new
	game.play_game
	replay
end

def replay
	puts "\n\nPlay again? Please enter 'y' for yes and 'n' for no"
	reply = gets.chomp.downcase
	if reply == "y"
		start_game
	else
		puts "Thanks for playing!"
	end
end


start_game

# frozen_string_literal: true

module Display

	def display_introduction
		puts "Let's play Connect Four on your terminal. \n\n"
	end

	def display_new_player(number)
		puts "\n\nPlease enter the name for player ##{number}"
	end

	def display_tie
		puts "\n\nThe game has been tied."
	end

	def display_win(player)
		puts "\n\nCongratulations #{player.name.capitalize}! You won!"
	end

	def display_move_prompt(player)
		puts "#{player.name.capitalize}, please select your column."
	end

	def display_invalid_input
		puts "\nThat input is invalid."
	end
end

# frozen_string_literal: true
require_relative 'display.rb'



class Game
	include Display
	attr_accessor :player1, :player2, :current_player, :board

	def initialize
		@player1 = nil
		@player2 = nil	
		@current_player = nil
		@board = Board.new
	end

	def play_game
	end


	def player_creation
		player_number = player1.nil? ? 1 : 2
		display_new_player(player_number)
		name = gets.chomp
		token = player_number == 1 ? "\e[32m\u2620\e[0m" : "\e[35m\u2620\e[0m"
		player = Player.new(name, token)
		@current_player = player if @current_player.nil?
		return player
	end

	def player_turn
		@board.show
		column = player_input(@current_player)
		# token = @current_player.token
		board.set_token(column, @current_player.token)
		#board.checkwin(column, )
		@current_player = switch_current_player
	end

	def check_horizontal(cords)
		tally = 0
		# binding.pry
		row = cords[0]
		column = cords[1]
		tally_r = check_right(row, column, tally)
		tally_l = check_left(row, column, tally)
		# binding.pry
		((tally_r + tally_l) - 1) >= 4 ? true : false
	end

	def check_vertical(cords)
		tally = 0
		row = cords[0]
		column = cords[1]
		tally_u = check_up(row, column, tally)
		tally_d = check_down(row, column, tally)
		# binding.pry
		((tally_u + tally_d) - 1) >= 4 ? true : false
	end

	def check_vertical(cords)
		tally = 0
		row = cords[0]
		column = cords[1]
		tally_u = check_up(row, column, tally)
		tally_d = check_down(row, column, tally)
		# binding.pry
		((tally_u + tally_d) - 1) >= 4 ? true : false
	end

	
	private

	def game_setup
		display_introduction
		@player1 = player_creation
		@player2 = player_creation
	end

	def game_turns
	end

	def switch_current_player
		@current_player = @current_player == @player1 ? @player2 : @player1
	end

	def player_input(player)
		display_move_prompt(@current_player)
		input = gets.chomp.to_i
		return input unless board.column_full?((input - 1))
		display_invalid_input
		player_input(player)
	end

	def check_right(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row][column + 1] == nil ? tally : check_right(row, column + 1, tally)
		else
			return tally
		end
	end

	def check_left(row, column, tally)
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row][column - 1] == nil ? tally : check_left(row, column - 1, tally)
		else
			return tally
		end
	end

	def check_up(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row - 1] == nil ? tally : check_up(row - 1, column, tally)
		else
			return tally
		end
	end

	def check_down(row, column, tally)
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row + 1] == nil ? tally : check_down(row + 1, column, tally)
		else
			return tally
		end
	end
end
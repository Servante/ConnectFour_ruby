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
		game_setup
		game_turns
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
		coords = board.set_token(column, @current_player.token)
		check_win(coords)
	end

	def check_win(coords)
		# binding.pry
		win = []
		win << check_horizontal(coords)
		win << check_vertical(coords)
		win << check_ne_sw(coords)
		win << check_nw_se(coords)
		result = win.include?(true) ? true : false
		game_finish("player_win") if result = true
	end

	
	private

	def game_setup
		display_introduction
		@player1 = player_creation
		@player2 = player_creation
	end

	def game_turns
		until board.board_full?
			player_turn
			switch_current_player
		end
		game_finish("tie")
	end

	def switch_current_player
		@current_player = @current_player == @player1 ? @player2 : @player1
	end

	def player_input(player)
		display_move_prompt(@current_player)
		input = gets.chomp.to_i
		return (input - 1) unless board.column_full?((input - 1))
		display_invalid_input
		player_input(player)
	end

	def game_finish(outcome)
		board.show
		outcome == "player_win" ? display_win : display_tie
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

	def check_ne_sw(cords)
		tally = 0
		row = cords[0]
		column = cords[1]
		tally_ne = check_ne(row, column, tally)
		tally_sw = check_sw(row, column, tally)
		# binding.pry
		((tally_ne + tally_sw) - 1) >= 4 ? true : false
	end

	def check_nw_se(cords)
		tally = 0
		row = cords[0]
		column = cords[1]
		tally_nw = check_nw(row, column, tally)
		tally_se = check_se(row, column, tally)
		# binding.pry
		((tally_nw + tally_se) - 1) >= 4 ? true : false
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

	def check_ne(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row - 1] == nil || board.cells[row][column + 1] == nil ? tally : check_ne(row - 1, column + 1, tally)
		else
			return tally
		end
	end

	def check_sw(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row + 1] == nil || board.cells[row][column - 1] == nil ? tally : check_sw(row + 1, column - 1, tally)
		else
			return tally
		end
	end

	def check_nw(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row - 1] == nil || board.cells[row][column - 1] == nil ? tally : check_sw(row - 1, column - 1, tally)
		else
			return tally
		end
	end

	def check_se(row, column, tally)
		# binding.pry
		if board.cells[row][column].value == @current_player.token
			tally += 1
			board.cells[row + 1] == nil || board.cells[row][column + 1] == nil ? tally : check_sw(row + 1, column + 1, tally)
		else
			return tally
		end
	end
end
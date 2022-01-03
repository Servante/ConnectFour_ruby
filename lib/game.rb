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

	def player_creation
		player_number = player1.nil? ? 1 : 2
		display_new_player(player_number)
		name = gets.chomp
		token = player_number == 1 ? "\e[32m\u2620\e[0m" : "\e[35m\u2620\e[0m"
		player = Player.new(name, token)
		@current_player = player if @current_player.nil?
		return player
	end
end
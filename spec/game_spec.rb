
# frozen_string_literal: true

require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/cell.rb'
require '../lib/player.rb'
require '../lib/display.rb'
require 'pry'



describe Game do 

	subject (:game) {described_class.new}


	describe '#player_creation' do 

		before do
				player1 = "wes"
				player2 = "bria"
				allow(game).to receive(:puts)
				allow(game).to receive(:gets).and_return(player1, player2)
				# allow(game).to receive(:gets).and_return(player2)
			end

		context 'when player creation is called and there is not a current_player' do

			it 'creates a new player' do
				expect(Player).to receive(:new)
				game.player_creation
			end

			it 'with a green skull and crossbones as a token' do
				player = game.player_creation
				expect(player.token).to eq("\e[32m\u2620\e[0m")
			end

			it 'sets player1 as @current_player' do
				player = game.player_creation
				expect(game.current_player).to be(player)
			end
		end

		context 'when player creation is called for player2' do

			before do
				player1 = game.player_creation
				game.instance_variable_set(:@player1, player1)
				player2 = game.player_creation
				game.instance_variable_set(:@player2, player2)
			end

			it 'creates player 2 with magenta skull and crossbones for a token' do
				expect(game.player2.token).to be("\e[35m\u2620\e[0m")
			end

			it 'and leaves player1 as @current_player' do 
				expect(game.current_player.name).to eq("wes")
			end
		end
	end

	describe '#player_turn' do

		before do
			player1 = Player.new("wes", "X")
			game.instance_variable_set(:@current_player, player1)
			allow(game.board).to receive(:show)
			allow(game).to receive(:player_input).and_return(3)
		end

		it 'sends message to update the board' do			
			expect(game.board).to receive(:set_token)
			game.player_turn
		end

	end

	describe '#check_right' do

		subject (:game) {described_class.new}

		before do
			player1 = Player.new("wes", "X")
			game.instance_variable_set(:@current_player, player1)
			game.board.set_token(1, "X")
			game.board.set_token(2, "X")
			game.board.set_token(3, "X")
		end


		context 'when checking a row that has 3 tokens of the same player in a row' do 
			it 'counts each and returns a tally of 3' do
				tally = game.check_right(6, 1, 0)
				expect(tally).to eq(3)
			end
		end

		context 'when checking a row that has no other tokens to the right of the one placed' do
			xit 'returns a tally of 1' do
			end
		end
	end
end

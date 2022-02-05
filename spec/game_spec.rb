
# frozen_string_literal: true

require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/cell.rb'
require '../lib/player.rb'
require '../lib/display.rb'
require 'pry'



describe Game do 

	subject (:game) {described_class.new}

	before do 
		game.board.set_token(0, "O")   #board setup - arranged in columns
		game.board.set_token(0, "X")
		game.board.set_token(0, "X")
		game.board.set_token(0, "X")
		game.board.set_token(0, "X")
		game.board.set_token(0, "X")

		game.board.set_token(1, "O")
		game.board.set_token(1, "O")
		game.board.set_token(1, "O")
		game.board.set_token(1, "O")
		game.board.set_token(1, "X")
				
		game.board.set_token(2, "O")
		game.board.set_token(2, "O")
		game.board.set_token(2, "O")
		game.board.set_token(2, "X")
		game.board.set_token(2, "X")

		game.board.set_token(3, "X")
		game.board.set_token(3, "O")
		game.board.set_token(3, "X")
		game.board.set_token(3, "O")
		game.board.set_token(3, "X")

		game.board.set_token(4, "X")
		game.board.set_token(4, "X")
		game.board.set_token(4, "X")
		game.board.set_token(4, "X")
		game.board.set_token(4, "O")
		game.board.set_token(4, "O")

		game.board.set_token(5, "X")
		game.board.set_token(5, "X")
		game.board.set_token(5, "X")
		game.board.set_token(5, "O")
		game.board.set_token(5, "O")
		game.board.set_token(5, "O")

		game.board.set_token(6, "X")
		game.board.set_token(6, "O")
		game.board.set_token(6, "X")
		game.board.set_token(6, "X")
	end



	describe '#player_creation' do 

		before do
				player1 = "wes"
				player2 = "bria"
				allow(game).to receive(:puts)
				allow(game).to receive(:gets).and_return(player1, player2)
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

# 	describe '#check_right' do

# 		subject (:game) {described_class.new}

# 		before do
# 			player1 = Player.new("wes", "X")
# 			game.instance_variable_set(:@current_player, player1)
# 			game.board.set_token(1, "X")
# 			game.board.set_token(2, "X")
# 			game.board.set_token(3, "X")
# 			game.board.set_token(4, "O")
# 			game.board.set_token(1, "X")
# 		end


# 		context 'when checking a row that has 3 tokens of the same player and an opponent\'s token at the end' do 
# 			it 'counts each and returns a tally of 3, ignoring the opponent\'s token' do
# 				tally = game.check_right(6, 1, 0)
# 				expect(tally).to eq(3)
# 			end
# 		end

# 		context 'when checking a row that has no other tokens to the right of the one placed' do
# 			it 'returns a tally of 1' do
# 				tally = game.check_right(5, 1, 0)
# 				expect(tally).to eq(1)
# 			end
# 		end
# 	end

	describe '#check_horizontal' do 

		before do
			player1 = Player.new("wes", "X")
			game.instance_variable_set(:@current_player, player1)
		end

		context 'when checking a row with 4 subsequent tokens on west boundary' do
			it 'returns true' do
				# game.current_player.instance_variable_set(:@token, "X")
				cords = [2, 0]
				expect(game.check_horizontal(cords)).to be true
			end
		end

		context 'when checking a row with 4 subsequent tokens on east boundary' do
			it 'returns true' do
				cords = [4, 3]
				expect(game.check_horizontal(cords)).to be true
			end
		end

		context 'when checking a row with less than 4 subsequent tokens' do
			it 'returns false' do
				cords = [1, 0]
				expect(game.check_horizontal(cords)).to be false
			end
		end
	end

	describe '#check_vertical' do

		before do
			player1 = Player.new("wes", "X")
			game.instance_variable_set(:@current_player, player1)
		end

		context 'when checking a column with 4 subsequent tokens' do
			it 'returns true' do
				cords = [1, 0]
				expect(game.check_vertical(cords)).to be true
			end
		end

		context 'when checking a column with less than 4 subsequent tokens' do
			it 'returns false' do
				cords = [3, 2]
				expect(game.check_vertical(cords)).to be false
			end
		end

		context 'when testing for edge case at top of board' do
			it 'does not return any errors' do
				cords = [1, 5]
				expect(game).not_to receive(:puts)
				game.check_vertical(cords)
			end
		end
	end

	describe '#check_NE' do 

		before do
		end
	end


end





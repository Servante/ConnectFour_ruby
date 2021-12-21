
# frozen_string_literal: true

require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/cell.rb'
require '../lib/player.rb'
require '../lib/display.rb'



describe Game do 

	subject (:game) {described_class.new}

	describe '#player_creation' do 

		context 'when player creation is called and there is not a current_player' do

			it 'creates a new player' do
				expect(Player).to receive(:new)
				game.player_creation
			end

			xit 'with a green skull and crossbones as a token' do
			end

			xit 'sets player1 as @current_player' do
			end
		end

		context 'when player creation is called for player2' do

			xit 'creates a new player' do 
			end

			xit 'with a magenta skull and crossbones' do
			end

			xit 'and leaves player1 as @current_player'
		end
	end
end

# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'


describe Board do

	subject(:board) {described_class.new} 

	describe 'create_cell' do		

		it 'creates a new cell' do
			expect(Cell).to receive(:new)
			board.create_cell
		end

		it 'will contain a "-" value as default' do
			cell = board.create_cell
			expect(cell.value).to be("-")
		end

		it 'will contain "false" as a default' do
			new_cell = board.create_cell
			expect(new_cell.stackable).to be(false)
		end
	end


	describe 'create_board' do
		context 'when create board is run' do

			before do
				new_cell = Cell.new("-", false)
				allow(board).to receive(:create_cell).and_return(new_cell)
			end


			xit 'creates a new hash' do
				expect(Hash).to receive(:new)
				board.create_board
			end
		end
	end
end

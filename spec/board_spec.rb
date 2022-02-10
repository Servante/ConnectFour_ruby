# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'

describe Board do

	subject(:board) {described_class.new} 

	describe '#initialize' do

		context 'when class is initialized' do

			it 'creates instance variable @cells that contains a hash of cells' do
				board = Board.new
				expect(board.cells).to be_a(Hash)
			end


			it 'creates unstackable cells for rows_1..5' do
				row1 = board.cells[1]
				stack1 = row1.collect {|c| c.stackable}
				row2 = board.cells[2]
				stack2 = row2.collect {|c| c.stackable}
				row3 = board.cells[3]
				stack3 = row3.collect {|c| c.stackable}
				row4 = board.cells[4]
				stack4 = row4.collect {|c| c.stackable}
				row5 = board.cells[5]
				stack5 = row5.collect {|c| c.stackable}
				expect(stack1.all?).to be(false)
				expect(stack2.all?).to be(false)
				expect(stack3.all?).to be(false)
				expect(stack4.all?).to be(false)
				expect(stack5.all?).to be(false)
			end

			it 'creates stackable cells for row_6' do
				cells = board.cells[6]
				stackable = cells.collect {|c| c.stackable}
				expect(stackable.all?).to be(true)
			end
		end
	end

	describe '#column_full?' do 

		context 'when the player enters a column that is empty' do

			it 'returns false' do
				full = board.column_full?(0)
				expect(full).to be(false)
			end
		end

		context 'when the player enters a column that is partial full' do

			before do 
				board.cells[1][0].value = "token"
			end

			it 'returns false' do
				full = board.column_full?(0)
				expect(full).to be(false)
			end
		end

		context 'when a player enters a column that is full' do

			before do 
				board.cells[1][0].value = "token"
				board.cells[2][0].value = "token"
				board.cells[3][0].value = "token"
				board.cells[4][0].value = "token"
				board.cells[5][0].value = "token"
				board.cells[6][0].value = "token"
			end

			it 'returns true' do
				full = board.column_full?(0)
				expect(full).to be(true)
			end
		end
	end

	describe '#set_token' do

		context 'when set_token is called on an empty column' do

			it 'sets the token on the bottommost cell' do
				token = "X"
				board.set_token(3, token)
				expect(board.cells[6][3].value).to eq(token)
			end

			it 'sets the above cell\'s @stackable to true' do
				above_cell = board.cells[5][3]
				token = "X"
				board.set_token(3, token)
				expect(above_cell.stackable).to be(true)
			end

			it 'sets current cell\'s @stackable to false' do
				token = "X"
				board.set_token(3, token)
				expect(board.cells[6][3].stackable).to be(false)
			end

			it 'returns the modified cells coordinates' do 
				token = "X"
				coords = board.set_token(3, token)
				expect(coords).to eq([6,3])
			end

		end

		context 'when set_token is called on a column with two tokens existing' do

			it 'sets the token to the 3rd from bottom cell' do
				token = "X"
				board.set_token(3, token)
				board.set_token(3, token)
				board.set_token(3, token)
				third_up = board.cells[4][3]
				expect(third_up.value).to eq(token)
			end
		end
	end

	describe '#board_full?' do 

		context 'when no columns are full' do

			it 'returns false' do
				expect(board).not_to be_board_full
			end
		end

		context 'when 3 columns are full' do

			before do
				board.cells.each do |k, v|
					counter = 0 
					until counter == 3
						board.cells[k][counter].value = "x"
						counter +=1
					end
				end
			end

			it 'returns false' do
				expect(board).not_to be_board_full
			end
		end

		context 'when all columns are full' do

			before do
				board.cells.each do |k, v|
					counter = 0 
					until counter == 7
						board.cells[k][counter].value = "x"
						counter +=1
					end
				end
			end

			it 'returns true' do
				expect(board).to be_board_full
			end
		end
	end
end

# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'


describe Board do

	subject(:board) {described_class.new} 

	describe 'initialize' do

		context 'when class is initialized' do
			it 'creates an instance variable called @cells that contains a hash' do
				board = Board.new
				expect(board.cells).to be_a(Hash)
			end

			it 'the row_6 cells are stackable' do
				cells = board.cells["row_6"]
				stackable = cells.collect {|c| c.stackable}
				expect(stackable.all?).to be(true)
			end

			it 'the rows_1..5 are not stackable' do
				row1 = board.cells["row_1"]
				stack1 = row1.collect {|c| c.stackable}
				row2 = board.cells["row_2"]
				stack2 = row1.collect {|c| c.stackable}
				row3 = board.cells["row_3"]
				stack3 = row1.collect {|c| c.stackable}
				row4 = board.cells["row_4"]
				stack4 = row1.collect {|c| c.stackable}
				row5 = board.cells["row_5"]
				stack5 = row1.collect {|c| c.stackable}
				expect(stack1.all?).to be(false)
				expect(stack2.all?).to be(false)
				expect(stack3.all?).to be(false)
				expect(stack4.all?).to be(false)
				expect(stack5.all?).to be(false)
			end
		end
	end



	# describe '#create_cell' do		

	# 	context 'if a new cell with a counter of 1 is created '

	# 	it 'creates a new cell' do
	# 		counter = 1
	# 		expect(Cell).to receive(:new).exactly(43).times
	# 		board.create_cell(counter)
	# 	end

	# 	xit 'will contain a "-" value as default' do
	# 		cell = board.create_cell
	# 		expect(cell.value).to be("-")
	# 	end

	# 	xit 'will contain "false" as a default' do
	# 		new_cell = board.create_cell
	# 		expect(new_cell.stackable).to be(false)
	# 	end
	# end


	# describe 'create_board' do
	# 	context 'when create board is run' do

	# 		before do
	# 			new_cell = Cell.new("-", false)
	# 			allow(board).to receive(:create_cell).and_return(new_cell)
	# 		end


	# 		it 'creates a new hash' do
	# 			new_board = board.create_board
	# 			expect(new_board).to be_a(Hash)
	# 		end
	# 	end
	# end
end

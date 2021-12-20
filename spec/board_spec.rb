# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'


describe Board do

	subject(:board) {described_class.new} 

	describe 'initialize' do

		context 'when class is initialized' do
			it 'creates instance variable @cells that contains a hash of cells' do
				board = Board.new
				expect(board.cells).to be_a(Hash)
			end


			it 'creates unstackable cells for rows_1..5' do
				row1 = board.cells[:row_1]
				stack1 = row1.collect {|c| c.stackable}
				row2 = board.cells[:row_2]
				stack2 = row2.collect {|c| c.stackable}
				row3 = board.cells[:row_3]
				stack3 = row3.collect {|c| c.stackable}
				row4 = board.cells[:row_4]
				stack4 = row4.collect {|c| c.stackable}
				row5 = board.cells[:row_5]
				stack5 = row5.collect {|c| c.stackable}
				expect(stack1.all?).to be(false)
				expect(stack2.all?).to be(false)
				expect(stack3.all?).to be(false)
				expect(stack4.all?).to be(false)
				expect(stack5.all?).to be(false)
			end

			it 'creates stackable cells for row_6' do
				cells = board.cells[:row_6]
				stackable = cells.collect {|c| c.stackable}
				expect(stackable.all?).to be(true)
			end
		end
	end
end

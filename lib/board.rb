# frozen_string_literal: true

require_relative 'cell.rb'
require 'pry'

	def reload
		load 'board.rb'	
	end


class Board
		attr_accessor :cells

	def initialize
		@cells = create_board
	end

	def show

		puts <<-HEREDOC

		 1 |  2 |  3 |  4 |  5 |  6 |  7
		---+----+----+----+----+----+----
		 #{cells[1][0].value} |  #{cells[1][1].value} |  #{cells[1][2].value} |  #{cells[1][3].value} |  #{cells[1][4].value} |  #{cells[1][5].value} |  #{cells[1][6].value}
		---+----+----+----+----+----+----
		 #{cells[2][0].value} |  #{cells[2][1].value} |  #{cells[2][2].value} |  #{cells[2][3].value} |  #{cells[2][4].value} |  #{cells[2][5].value} |  #{cells[2][6].value}
		---+----+----+----+----+----+----
		 #{cells[3][0].value} |  #{cells[3][1].value} |  #{cells[3][2].value} |  #{cells[3][3].value} |  #{cells[3][4].value} |  #{cells[3][5].value} |  #{cells[3][6].value}
		---+----+----+----+----+----+----
		 #{cells[4][0].value} |  #{cells[4][1].value} |  #{cells[4][2].value} |  #{cells[4][3].value} |  #{cells[4][4].value} |  #{cells[4][5].value} |  #{cells[4][6].value}
		---+----+----+----+----+----+----
		 #{cells[5][0].value} |  #{cells[5][1].value} |  #{cells[5][2].value} |  #{cells[5][3].value} |  #{cells[5][4].value} |  #{cells[5][5].value} |  #{cells[5][6].value}
		---+----+----+----+----+----+----
		 #{cells[6][0].value} |  #{cells[6][1].value} |  #{cells[6][2].value} |  #{cells[6][3].value} |  #{cells[6][4].value} |  #{cells[6][5].value} |  #{cells[6][6].value}
		---+----+----+----+----+----+----

		HEREDOC

	end


	def column_full?(input)
		arr = []
		@cells.each_key {|k| arr << @cells[k][input].value}
		arr.any?('-') ? false : true
	end

	def board_full? 
		counter = 0
		full_columns = 0
		until counter == 7
			full_columns += 1 if column_full?(counter)
			counter += 1
		end
		full_columns >= 7 ? true : false
	end


	def set_token(column, token, row = 1)
		if @cells[row][column].stackable == true
			@cells[row][column].stackable = false
			@cells[row-1] == nil ? @cells[row][column].value = token : @cells[row-1][column].stackable = true ; @cells[row][column].value = token
			return row, column #returns cordinates for assigned cell. used for #checkwin
		else
			set_token(column, token, row + 1)
		end
	end

	private

	def create_board
		hash = Hash.new
		counter = 1
		(6).times do 
			array = []
			(7).times do 
				new_cell = create_cell(counter)
				array << new_cell
			end
			counter_s = counter.to_i
			hash[counter_s] = array
			counter += 1
		end
		return hash
	end

	def create_cell(counter)
		if counter == 6
			new_cell = Cell.new("-", true)
		elsif
			new_cell = Cell.new
		end
		return new_cell
	end

	def valid_move?(input)
	end
end

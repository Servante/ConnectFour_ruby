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
		 #{cells[:row_1][0].value} |  #{cells[:row_1][1].value} |  #{cells[:row_1][2].value} |  #{cells[:row_1][3].value} |  #{cells[:row_1][4].value} |  #{cells[:row_1][5].value} |  #{cells[:row_1][6].value}
		---+----+----+----+----+----+----
		 #{cells[:row_2][0].value} |  #{cells[:row_2][1].value} |  #{cells[:row_2][2].value} |  #{cells[:row_2][3].value} |  #{cells[:row_2][4].value} |  #{cells[:row_2][5].value} |  #{cells[:row_2][6].value}
		---+----+----+----+----+----+----
		 #{cells[:row_3][0].value} |  #{cells[:row_3][1].value} |  #{cells[:row_3][2].value} |  #{cells[:row_3][3].value} |  #{cells[:row_3][4].value} |  #{cells[:row_3][5].value} |  #{cells[:row_3][6].value}
		---+----+----+----+----+----+----
		 #{cells[:row_4][0].value} |  #{cells[:row_4][1].value} |  #{cells[:row_4][2].value} |  #{cells[:row_4][3].value} |  #{cells[:row_4][4].value} |  #{cells[:row_4][5].value} |  #{cells[:row_4][6].value}
		---+----+----+----+----+----+----
		 #{cells[:row_5][0].value} |  #{cells[:row_5][1].value} |  #{cells[:row_5][2].value} |  #{cells[:row_5][3].value} |  #{cells[:row_5][4].value} |  #{cells[:row_5][5].value} |  #{cells[:row_5][6].value}
		---+----+----+----+----+----+----
		 #{cells[:row_6][0].value} |  #{cells[:row_6][1].value} |  #{cells[:row_6][2].value} |  #{cells[:row_6][3].value} |  #{cells[:row_6][4].value} |  #{cells[:row_6][5].value} |  #{cells[:row_6][6].value}
		---+----+----+----+----+----+----

		HEREDOC

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
			hash[("row_#{counter_s}").to_sym] = array
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

end

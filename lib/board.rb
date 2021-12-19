# frozen_string_literal: true

class Board
	attr_accessor :cells

	def reload
		load 'board.rb'
		self.show
	
	end

	def initialize
		# @cells = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]
		@cells = {"row_1" => [0,1,2,3,4,5,6],
					    "row_2" => [7,8,9,10,11,12,13],
					    "row_3" => [14,15,16,17,18,19,20],
					    "row_4" => [21,22,23,24,25,26,27],
					    "row_5" => [28,29,30,31,32,33,34],
					    "row_6" => [35,36,37,38,39,40,41]}



	end


	def show

		puts <<-HEREDOC

		 #{cells[0]} |  #{cells[1]} |  #{cells[2]} |  #{cells[3]} |  #{cells[4]} |  #{cells[5]} |  #{cells[6]}
		---+----+----+----+----+----+----
		 #{cells[7]} |  #{cells[8]} | #{cells[9]} | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]}
		---+----+----+----+----+----+----
		#{cells[14]} | #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]}
		---+----+----+----+----+----+----
		#{cells[21]} | #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]}
		---+----+----+----+----+----+----
		#{cells[28]} | #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]}
		---+----+----+----+----+----+----
		#{cells[35]} | #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]}
		---+----+----+----+----+----+----

		HEREDOC

	end

end

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
			hash["row_#{counter_s}"] = array
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

# frozen_string_literal: true

class Player
	attr_accessor :name, :token

	def initialize(name, token)
		@name = name
		@token = token
	end
end

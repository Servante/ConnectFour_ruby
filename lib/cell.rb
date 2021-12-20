# frozen_string_literal: true

class Cell
	attr_accessor :value, :stackable

	def initialize(value = "-", stackable = false)
		@value = value
		@stackable = stackable
	end
end



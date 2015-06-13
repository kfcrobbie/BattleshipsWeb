class Plane 

	attr_accessor :flying

	def initialize
		@flying=true
	end

	def flying?
		flying
	end

	def land
		self.flying=false
	end
end
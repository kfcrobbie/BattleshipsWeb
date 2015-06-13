require_relative 'plane'

class Airport

	attr_accessor :planes

	def initialize
		@planes=[]
	end

	def land_plane plane
		plane.land
		planes << plane

	end

	def take_off 
		planes.last.flying=true
		planes.pop
	end
end
require_relative 'plane'

class Airport

	def land_plane plane
		plane.flying = false
		plane

	end

	def take_off
		Plane.new
	end
end
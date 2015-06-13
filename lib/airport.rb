require_relative 'plane'

class Airport

	def land_plane plane
		plane.flying = false
		plane

	end
end
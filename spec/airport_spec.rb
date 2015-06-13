require 'airport'

describe Airport do 
	it 'A new airport must allow planes to land' do 
		expect(subject).to respond_to :land_plane
	end

	it 'A new Airport must allow planes to land' do
		plane=Plane.new
		expect(subject.land_plane plane).to eq plane
	end

	
end
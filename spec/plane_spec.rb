require 'plane'

describe Plane do 
	it 'A new plane is created on the ground' do 
		expect(subject).to_not be_flying
	end
end
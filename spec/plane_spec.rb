require 'plane'

describe Plane do 
	it 'A new plane taking off shoudl be flying' do 
		expect(subject).to be_flying
	end
end
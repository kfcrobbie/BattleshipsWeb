require 'airport'

describe Airport do 
	it 'A new airport must allow planes to land' do 
		expect(subject).to respond_to :land_plane
	end

	xit 'A new Airport must allow planes to land' do
		plane=double :plane
		expect(subject.land_plane plane).to eq plane
	end

	it 'A plane must not be flying after landing' do 
		plane=
		subject.land_plane plane
		expect(plane).to_not be_flying
	end

	it "A plane must allow planes to take off" do 
		expect(subject).to respond_to :take_off
	end

	it "A plane that takes off must be flying" do 
		subject.land_plane Plane.new
		expect(subject.take_off).to be_flying


	end
end

 


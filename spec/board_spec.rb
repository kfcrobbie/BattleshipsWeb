require 'board'

describe Board do

  describe 'place_h' do
    it 'Places the ship horizontally on the board at a specific point' do
      destroyer = double :destroyer, size: 2
      subject.place_h(destroyer,'B2')
      expect(subject.grid[1][1..2]).to eq [destroyer,destroyer]
    end

    it 'Doesn\'t allow ships to overlap' do
      destroyer = double :destroyer, size: 2
      submarine = double :submarine, size: 3
      subject.place_v(destroyer,'B2')
      expect{subject.place_h(submarine,'B2')}.to raise_error 'Ship already placed there!'
    end

    it 'Doesn\'t allow ships to be placed outside the board' do
      destroyer = double :destroyer, size: 2
      expect{subject.place_h(destroyer,'A10')}.to raise_error 'Ship cannot place ship outside board!'
    end
  end

  describe 'place_v' do
    it 'Places the ship vertically on the board at a specific point' do
      submarine = double :submarine, size: 3
      subject.place_v(submarine,'A1')
      expect([subject.grid[0][0], subject.grid[1][0], subject.grid[2][0]]).to eq [submarine,submarine,submarine]
    end

    it 'Doesn\'t allow ships to overlap' do
      destroyer = double :destroyer, size: 2
      submarine = double :submarine, size: 3
      subject.place_h(submarine,'A1')
      expect{subject.place_v(destroyer,'A1')}.to raise_error 'Ship already placed there!'
    end

    it 'Doesn\'t allow ships to be placed outside the board' do
      destroyer = double :destroyer, size: 2
      expect{subject.place_v(destroyer,'J1')}.to raise_error 'Cannot place ship outside board!'
    end
  end


  describe 'strike' do

    it 'can hit a ship placed on the board' do
      destroyer = double :destroyer, size: 2
      subject.place_h(destroyer,'A1')
      subject.strike('A1')
      expect(subject.grid[0][0]).to eq 'H'
    end

    it 'reports when a ship is hit' do
      destroyer = double :destroyer, size: 2
      subject.place_h(destroyer,'A1')
      expect(subject.strike('A1')).to eq 'H'
    end

    it 'misses when a ship is not hit' do
      destroyer = double :destroyer, size: 2
      subject.place_h(destroyer,'A1')
      subject.strike('B2')
      expect(subject.grid[1][1]).to eq 'M'
    end


      #May not even need double here...
    it 'reports when a strike has missed' do
      destroyer = double :destroyer, size: 2
      subject.place_h(destroyer,'A1')
      expect(subject.strike('D2')).to eq 'M'
    end

    # it 'reports when a ship is hit' do
    #   subject.place_horizontal('destroyer',1,'a')
    #   expect(subject.report_strike(1,'a')).to eq 'HIT!'
    # end



  end


  #   it 'returns a miss if ship is not hit' do
  #     subject.place('destroyer',2)
  #     expect(subject.strike(7)).to eq 'MISS!'
  #   end
  #
  #   it 'records "H" if ship is hit' do
  #     subject.place('destroyer', 2)
  #     subject.strike(3)
  #     expect(subject.board[2]).to eq 'H'
  #   end

end

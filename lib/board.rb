class Board

  attr_accessor :y_coordinate, :x_coordinate, :grid
  attr_reader :rise, :run

  def initialize
    @grid = [['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],
             ['w','w','w','w','w','w','w','w','w','w'],]


    @rise = ('A'..'J').zip(0..9).to_h
    @run = (1..10).zip(0..9).to_h
  end

  # def y_coordinate(position)
  #   rise[(position[0]).to_s]
  # end
  # # use y = y_coordinate


  def convert_coordinates(position)
    self.y_coordinate = rise[(position[0]).to_s]
    self.x_coordinate = run[(position[1..2]).to_i]
  end

  def place_h(ship,position)
    # fail 'invalid object' unless ship.kind_of? Ship
    convert_coordinates(position)
    fail 'Ship already placed there!' if grid[y_coordinate][x_coordinate...(x_coordinate+ship.size)].any? { |element| element != 'w' }
    fail 'Ship cannot place ship outside board!' if (x_coordinate + ship.size) > grid.length
    grid[y_coordinate][x_coordinate...(x_coordinate+ship.size)] = Array.new(ship.size, ship)
  end

  def place_v(ship,position)
    lat = lat_array(ship,position)
    long = long_array(ship,position)
    combined = combined_lat_long(lat, long)
    fail 'Cannot place ship outside board!' if (y_coordinate + ship.size) > grid.length
    fail 'Ship already placed there!' if combined.any? {|element1, element2| grid[element1][element2] != 'w' }
    combined.each {|element1, element2| grid[element1][element2] = ship}
  end

  def lat_array(ship,position)
    convert_coordinates(position)
    lat_array = (y_coordinate...y_coordinate+ship.size).to_a
  end

  def long_array(ship,position)
    convert_coordinates(position)
    long_array = ((x_coordinate.to_s)*(ship.size)).split('').map! {|s| s.to_i}
  end

  def combined_lat_long(lat_array, long_array)
    combined_lat_long = lat_array.zip(long_array)
  end

  def strike(position)
      convert_coordinates(position)
      @grid[y_coordinate][x_coordinate] != ('w' || 'M') ? @grid[y_coordinate][x_coordinate] = 'H' : @grid[y_coordinate][x_coordinate] = 'M'
      # report_strike(y,x_int)
    end

end




    #  grid_place = @coordinates_converter(user_coordinates)
#     # #  fail 'Cannot place ship outside board!' if ((x-1)+ships[ship])>@grid.length
#     # #  fail 'Ship already placed there!' if @grid[y-1][(x)..(x+ships[ship])].any? { |element| element != 'w' }
#     #  @grid[grid_place(0)][grid_place(1)...grid_place(1)+ship[ships]] = create_array(ship)
#     # #    (x)...(x+ships[ship])] = create_array(ship)
#     #  @grid
#   end
#
#   def place_vertical(ship,y,x)
#     fail 'Cannot place ship outside board!' if ((y-1)+ships[ship])>@grid.length
#     combine_y_x(ship,y,x)
#     @grid
#   end
#
  # def convert_y(ship,y)
  #   y_array = (y-1...y+ships[ship]-1).to_a
  #   # y_array_of_arrays = y_array.each {|y| y.to_a}
  # end
  #
  # def convert_x(ship,x)
  #   x = @alphabet.index(x)
  #   x_array = ((x.to_s)*ships[ship]).split('').map! {|s| s.to_i}
  #   # x_array_of_arrays = x_array {|x| x.to_a}
  # end
  #
  # def combine_y_x(ship,y,x)
  #    z = convert_y(ship,y).zip(convert_x(ship,x))
  #    fail 'Ship already placed there!' if z.any? { |y,x| @grid[y][x] != 'w' }
  #    z.each { |y,x| @grid[y][x] = ship[0] }
  # end

#   def strike(y,x)
#     x_int = @alphabet.index(x)
#     @grid[y-1][x_int] != ('w' || 'M') ? @grid[y-1][x_int] = 'H' : @grid[y-1][x_int] = 'M'
#     # || @grid[y-1][x_int] != 'M'
#     report_strike(y,x_int)
#   end
#
#   def report_strike(y,x)
#     @grid[y-1][x] == 'H' ? 'HIT!' : 'MISS!'
#   end
#
#
#   def create_array(ship)
#       (ship[0]*ships[ship]).split('')
#   end
#
#
#   # destroyer = Ship.New([s,s])
#   # cruiser = Ship.New([s,s,s])
#   # submarine = Ship.New([s,s,s])
#   # battleship = Ship.New([s,s,s,s])
#   # aircraft_carrier = Ship.New([s,s,s,s,s])
#
# end

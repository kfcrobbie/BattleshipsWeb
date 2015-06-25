class Random_coordinates

  def initialize
    @fired_locations = []
  end

  def random_shot

    all_coords = ((("A".."J").to_a).product((1..10).to_a)).map{|coord| coord[0] + coord[1].to_s}

    random = all_coords.sample
    if @fired_locations.include?(random)
      random_shot
    else
      @fired_locations << random
      random
    end
  end
end

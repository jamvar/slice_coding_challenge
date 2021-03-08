# PizzaBot for slice pizza delivery

class PizzaBot
  attr_reader :locations, :neighborhood

  def initialize(neighborhood:, locations:)
    @locations = locations_in_array(locations)
    @neighborhood = dimensions_in_array(neighborhood)
  end

  def delivery_instructions
    return 'Sorry, Bad Location!' if out_of_range?

    delivery_instructions = ''
    @locations.unshift([0, 0])
    @locations.each_cons(2) do |point_1, point_2|
      delivery_instructions << get_directions(
        starting_point: point_1,
        stoping_point: point_2
      )
      delivery_instructions << 'D'
    end

    delivery_instructions
  end

  def get_directions(starting_point:, stoping_point:)
    x_move = get_horizontal_move(
               start_x_coord: starting_point[0],
               stop_x_coord: stoping_point[0]
             )

    y_move = get_vertical_move(
               start_y_coord: starting_point[1],
               stop_y_coord: stoping_point[1]
             )

    "#{x_move}#{y_move}"
  end

  def out_of_range?
    locations.each do |location|
      return true if location[0] > (neighborhood[0] - 1) || location[1] > (neighborhood[1] - 1)
    end

    false
  end

  private

  def dimensions_in_array(neighborhood)
    neighborhood.split('x').map(&:to_i)
  end

  def locations_in_array(locations)
    locations.delete! '(' ')'
    locations.split(' ').map(&:to_i).each_slice(2).to_a
  end

  def get_horizontal_move(start_x_coord:, stop_x_coord:)
    if start_x_coord < stop_x_coord
      "E"*(stop_x_coord - start_x_coord)
    elsif start_x_coord > stop_x_coord
      "W"*(start_x_coord - stop_x_coord)
    end
  end

  def get_vertical_move(start_y_coord:, stop_y_coord:)
    if start_y_coord < stop_y_coord
      "N"*(stop_y_coord - start_y_coord)
    elsif start_y_coord > stop_y_coord
      "S"*(start_y_coord - stop_y_coord)
    end
  end
end

def get_instructions(instruction_string)
  # instruction_string = “5x5 (1, 3) (4, 4)”
  instructions_array = instruction_string.split(' ', 2)
  neighborhood_dimensions = instructions_array[0]
  delivery_locations = instructions_array[1]

  instructions = PizzaBot.new(
                   neighborhood: neighborhood_dimensions,
                   locations: delivery_locations
                 ).delivery_instructions
end

get_instructions("5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)")

# PizzaBot for slice pizza delivery

require_relative 'pizzabot_helper'

class PizzaBot
  attr_reader :locations, :neighborhood

  # Initializes PizzaBot with neighborhood <Array> and locations <Array>
  def initialize(neighborhood:, locations:)
    @neighborhood = PizzaBotHelper.dimensions_in_array(neighborhood)
    @locations = PizzaBotHelper.locations_in_array(locations)
  end

  # Returns the delivery_instructions string with compass directions
  def delivery_instructions
    return 'Incorrect Input' unless valid_neighborhood && valid_locations

    return 'Sorry, one or more of location is out of range!' if PizzaBotHelper.out_of_range?(neighborhood, locations)

    drive_starting_point = [0, 0]
    @locations.unshift(drive_starting_point)

    delivery_instructions = ''

    @locations.each_cons(2) do |start_coord, stop_coord|
      delivery_instructions << get_directions(
        start_coord: start_coord,
        stop_coord: stop_coord
      )
      delivery_instructions << 'D'
    end

    delivery_instructions
  end

  # Returns the compass directions between the given coordinates
  def get_directions(start_coord:, stop_coord:)
    x_move = PizzaBotHelper.horizontal_steps(
               start_x_coord: start_coord[0],
               stop_x_coord: stop_coord[0]
             )

    y_move = PizzaBotHelper.vertical_steps(
               start_y_coord: start_coord[1],
               stop_y_coord: stop_coord[1]
             )

    "#{x_move}#{y_move}"
  end

  private

  def valid_neighborhood
    !neighborhood.nil? && neighborhood.is_a?(Array) && neighborhood.length == 2 && neighborhood != [0, 0]
  end

  def valid_locations
    !locations.nil? && locations.is_a?(Array) && locations.flatten.length.even?
  end
end

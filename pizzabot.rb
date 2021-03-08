require_relative 'pizza_bot_helper'

class PizzaBot
  include PizzaBotHelper

  attr_reader :locations, :neighborhood

  def initialize(neighborhood:, locations:)
    @locations = PizzaBotHelper.locations_in_array(locations)
    @neighborhood = PizzaBotHelper.dimensions_in_array(neighborhood)
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
end

def get_directions(starting_point:, stoping_point:)
  x_move = PizzaBotHelper.get_horizontal_move(
             start_x_coord: starting_point[0],
             stop_x_coord: stoping_point[0]
           )

  y_move = PizzaBotHelper.get_vertical_move(
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

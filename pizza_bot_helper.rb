# PizzaBot Helper method

module PizzaBotHelper

  def self.dimensions_in_array(neighborhood)
    neighborhood.split('x').map(&:to_i)
  end

  def self.locations_in_array(locations)
    locations.delete! '(' ')'
    locations.split(' ').map(&:to_i).each_slice(2).to_a
  end

  def self.get_horizontal_move(start_x_coord:, stop_x_coord:)
    if start_x_coord < stop_x_coord
      "E"*(stop_x_coord - start_x_coord)
    elsif start_x_coord > stop_x_coord
      "W"*(start_x_coord - stop_x_coord)
    end
  end

  def self.get_vertical_move(start_y_coord:, stop_y_coord:)
    if start_y_coord < stop_y_coord
      "N"*(stop_y_coord - start_y_coord)
    elsif start_y_coord > stop_y_coord
      "S"*(start_y_coord - stop_y_coord)
    end
  end
end

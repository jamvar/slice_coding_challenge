# PizzaBot Helper

module PizzaBotHelper
  def self.dimensions_in_array(neighborhood)
    neighborhood.split('x').map(&:to_i)
  end

  def self.locations_in_array(locations)
    locations.delete! '(' ')' ','
    locations.split(' ').map { |l| l.to_i if l.to_i.to_s == l }.compact.each_slice(2).to_a
  end

  def self.horizontal_steps(start_x_coord:, stop_x_coord:)
    if start_x_coord < stop_x_coord
      "E"*(stop_x_coord - start_x_coord)
    elsif start_x_coord > stop_x_coord
      "W"*(start_x_coord - stop_x_coord)
    end
  end

  def self.vertical_steps(start_y_coord:, stop_y_coord:)
    if start_y_coord < stop_y_coord
      "N"*(stop_y_coord - start_y_coord)
    elsif start_y_coord > stop_y_coord
      "S"*(start_y_coord - stop_y_coord)
    end
  end

  def self.out_of_range?(neighborhood, locations)
    locations.each do |location|
      return true if location[0] > (neighborhood[0] - 1) || location[1] > (neighborhood[1] - 1)
    end

    false
  end
end

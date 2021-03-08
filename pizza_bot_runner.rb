require_relative 'pizzabot'

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

# print get_instructions("5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)")

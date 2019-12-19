class Game
  attr_reader :position
  COMMANDS = ["look", "take"]
  DIRECTIONS = ["n", "s", "e", "w"]

  def initialize
    Room.create_map
    @position = 0;
  end

  def start
    puts "\n"
    puts "Welcome to Text Adventure!\n"
    puts "You are in the #{map[position].name}"
    puts "Where do you want to go now?"
    puts "\n"
  end

  def map
    Room.map
  end

  def input_is_valid?(user_input)
    user_input.downcase == 'n' ||
    user_input.downcase == 's' ||
    user_input.downcase == 'e' ||
    user_input.downcase == 'w'
  end

  def invalid_choice
    puts "That's not a valid direction."
    run
  end

  def get_direction_word(direction)
    case direction.downcase
      when  'n'
        return "north"
      when 's'
        return "south"
      when 'e'
        return "east"
      when 'w'
        return "west"
      end
  end

  def go_in_direction(d)
    direction = get_direction_word(d).upcase
    puts "You decided to go #{direction}"
  end

  def move
    user_input = nil
    until user_input do
      puts "Enter a direction to go [N, S, E, W]"
      user_input = gets.strip

      input_is_valid?(user_input) ?
        go_in_direction(user_input)
        : invalid_choice
    end
  end

  def run
    start
    move
  end
end
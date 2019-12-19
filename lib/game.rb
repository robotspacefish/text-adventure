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
    puts "You are in the #{current_room.name}"
    puts "Where do you want to go now?"
    puts "\n"
  end

  def map
    Room.map
  end

  def current_room
    map[position]
  end

  def look
    current_room.description
  end

  def input_is_valid?(user_input)
    is_command?(user_input) || is_direction?(user_input)
  end

  def invalid_choice
    puts "Invalid Input."
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

  def is_command?(user_input)
    COMMANDS.include?(user_input.downcase)
  end

  def is_direction?(user_input)
    DIRECTIONS.include?(user_input)
  end
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
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

  def print_choices
    puts "Choose from these commands: [#{COMMANDS.join(", ")}]"
    puts "Or enter a direction to go [N, S, E, W]: " #TODO only output directions that exist in current_room
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

  def action(user_input)
    if is_direction?(user_input)
      move(user_input)
    elsif is_command?(user_input)

    end
  end

  def move(d)
    direction = get_direction_word(d).upcase
    puts "You decided to go #{direction}"
  end

  def run
    start
    user_input = nil
    loop do
      print_choices

      user_input = gets.strip
      puts "\n"
      input_is_valid?(user_input) ?
        action(user_input) : invalid_choice
    end
  end
end
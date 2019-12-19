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
    puts "Welcome to Text Adventure!\n".blue
    puts "You are in the #{current_room.name}\n".blue
    puts "Where do you want to go now?".yellow
    puts "\n"
  end

  def map
    Room.map
  end

  def current_room
    map[position]
  end

  def get_exit_options
    exits = []
    # TODO get valid exit options for current room
  end

  def look
    puts current_room.description.blue
    puts "\n"
  end

  def input_is_valid?(user_input)
    is_command?(user_input) || is_direction?(user_input)
  end

  def invalid_choice
    puts "Invalid Input.".red
    puts "\n"
    update
  end

  def print_choices
    puts "Choose from these commands: [#{COMMANDS.join(", ")}]".yellow

    # TODO use exit options for current room
    puts "Or enter a direction to go [N, S, E, W]: ".yellow #TODO only output directions that exist in current_room
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
    DIRECTIONS.include?(user_input.downcase)
  end

  def action(user_input)
    if is_direction?(user_input)
      move(user_input)
    elsif is_command?(user_input)
      self.send(user_input.downcase)
    end
  end

  def move(d)
    direction = get_direction_word(d).upcase
    puts "You decided to go #{direction}"
  end

  def run
    start
    user_input = nil
    update(user_input)
  end

  def update(user_input = nil)
    loop do
      print_choices

      user_input = gets.strip
      puts "\n"
      input_is_valid?(user_input) ?
        action(user_input) : invalid_choice
    end
  end
end
class Game
  attr_accessor :position, :new_position, :current_room
  COMMANDS = ["look", "take"]
  DIRECTIONS = ["n", "s", "e", "w"]

  def initialize
    Room.create_map
    @position = 0;
    @current_room = map[position]
  end

  def start
    puts "\n"
    puts "Welcome to Text Adventure!\n".blue
    puts "You are in the #{self.current_room.name}\n".blue
    puts "Where do you want to go now?".yellow
    puts "\n"
  end

  def map
    Room.map
  end

  def quit
    puts "Do you really want to quit? [y/n]".red
    user_input = gets.strip

    if really_quit?(user_input)
      puts "\nFarewell, traveler!\n".red
      exit
    end
  end

  def really_quit?(user_input)
    user_input.downcase == 'y'
  end

  def get_exit_options
    exits = {
      n: self.current_room.n,
      s: self.current_room.s,
      e: self.current_room.e,
      w: self.current_room.w
    }.select { |k, v| v != -1 }
  end

  def print_current_exit_options
   get_exit_options.collect { |k, v| k.to_s.upcase }.join(", ")
  end

  def look
    puts self.current_room.description.blue
    puts "\n"
  end

  def input_is_valid?(user_input)
    is_command?(user_input) || is_direction?(user_input)
  end

  def invalid_choice(user_input)
    if DIRECTIONS.include?(user_input.downcase)
      puts "You can't go that way.".red
    else
      puts "Invalid Command.".red
    end
    puts "\n"
    update
  end

  def print_choices
    puts "Choose from these commands: [#{COMMANDS.join(", ")}]"
    puts "Enter a direction to go [#{print_current_exit_options}]"
    puts "Or type 'quit' to close the game".red
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
    get_exit_options.include?(user_input.downcase.to_sym)
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
    puts "You chose to go #{direction}.\n"

    self.position = get_next_room_index(d)
    self.current_room = map[self.position]

    puts "You are now in the #{self.current_room.name}.\n".blue
  end

  def get_next_room_index(direction)
    current_room.send(direction.to_sym)
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

      if user_input.downcase == 'quit'
        quit
      else
        input_is_valid?(user_input) ?
        action(user_input) : invalid_choice(user_input)
      end
    end
  end
end
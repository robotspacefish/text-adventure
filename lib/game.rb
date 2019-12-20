class Game
  # attr_accessor :position, :new_position, :current_room
  attr_reader :player
  attr_accessor :current_dungeon

  COMMANDS = ["look", "take"]
  DIRECTIONS = ["n", "s", "e", "w"]

  def initialize
    @current_dungeon = Dungeon_01.create
    @player = Player.create(current_dungeon[2])
  end

  def start
    puts "\n"
    puts "Welcome to Text Adventure!\n".blue
    puts "You are in Room #{player.location.loc}\n".blue
    puts "Where do you want to go now?".yellow
    puts "\n"
  end

  def map
    current_dungeon
  end

  def quit
    puts "Do you really want to quit? [y/n]".red
    user_input = gets.strip

    if really_quit?(user_input)
      puts "\nFarewell, adventurer!\n".red
      exit
    end
  end

  def really_quit?(user_input)
    user_input.downcase == 'y'
  end

  def get_exit_options
    exits = {
      n: player.location.n[:leads_to],
      s: player.location.s[:leads_to],
      e: player.location.e[:leads_to],
      w: player.location.w[:leads_to]
    }.select { |k, v| v != :no_exit }
  end

  def print_current_exit_options
   get_exit_options.collect { |k, v| k.to_s.upcase }.join(", ")
  end

  def look
    if player.location.description
      puts player.location.description.blue
    else
      puts "It's too dark to see anything." # todo
    end
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
    player.location = map[get_next_room_index(d)]

    puts "You are now in Room #{player.location.loc}.\n".blue
  end

  def get_next_room_index(direction)
    player.location.send(direction.to_sym)[:leads_to]
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
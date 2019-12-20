class Player < Actor
  def initialize(location = nil)
    super
    @type = 'player'
  end

  def take(item)
    self.inventory << item
    puts "You took the #{item}."
  end

  def drop(item)
    super
    puts "You dropped the #{item}."
  end
end
class Enemy < Actor
  @@all = []
  attr_accessor :type

  def initialize(location)
    super
  end

  def self.all
    @@all
  end

  def drop(item)
    super
    puts "The #{self.type} dropped the #{item}."
  end

  def self.create_goblin(location)
    e = self.new(location)
    e.type = 'goblin'
    e.description = 'Goblin' # todo
    # todo possible inventory from randomized items (instances)

    self.all << e

  end
end
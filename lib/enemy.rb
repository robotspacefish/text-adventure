class Enemy < Actor
  @@all = []

  def self.all
    @@all
  end

  def drop(item)
    super
    puts "The #{self.type} dropped the #{item}."
  end

  def self.create_goblin(location)
    e = self.new
    e.type = 'goblin'
    e.location = location
    e.description = 'Goblin' # todo
    # todo possible inventory from randomized items (instances)

    self.all << e
  end
end
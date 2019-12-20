class Player < Actor
  def self.create(location)
    p = self.new
    p.type = 'player'
    p.location = location
    p
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
class Room
  attr_accessor :name, :description
  attr_reader :n, :s, :e, :w
  @@MAP = [];

  def initialize(n, s, e, w)
    @n = n
    @s = s
    @e = e
    @w = w
  end

  def self.create(name, n, s, e, w, description = nil)
    r = self.new(n, s, e, w)
    r.name = name
    r.description = description
    self.map << r
  end

  def self.create_map
    self.create("Troll Room", -1, 2, -1, 1, "It's a dank, dark room that smells of troll")
    self.create("Forest", -1, -1, 0, -1)
    self.create("Cave", 0, -1, -1, 3)
    self.create("Dungeon", -1, -1, 2, -1)
  end

  def self.map
    @@MAP
  end
end
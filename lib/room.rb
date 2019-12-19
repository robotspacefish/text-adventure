class Room
  attr_accessor :n, :s, :e, :w, :name, :description
  @@MAP = [];

  def self.create(name, n, s, e, w, description = nil)
    r = self.new
    r.name = name
    r.n = n
    r.s = s
    r.e = e
    r.w = w
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
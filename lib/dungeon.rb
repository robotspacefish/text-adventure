class Dungeon < Room
  attr_accessor :map, :number
  @@MAPS = []

  def self.maps
    @@MAPS
  end

  def self.create_dungeon_01
    d1 = self.new
    d1.map = Array.new(36)
    d1.map[1] = Room.create("bat room", -1, -1, -1, 2)
    d1.map[2] = Room.create("entrance", 8, -1, 1, 3)
    d1.map[3] = Room.create("skeleton room", -1, -1, 2, -1)
    d1.map[8] = Room.create("skeleton room", 14, 2, -1, -1)
    d1.map[13] = Room.create("bat room", 19, -1, -1, 14)
    d1.map[14] = Room.create("key room", -1, 8, 13, 15)
    d1.map[15] = Room.create("compass room", -1, -1, 14, -1)
    d1.map[18] = Room.create("clue room", -1, -1, -1, 19)
    d1.map[19] = Room.create("blob room", -1, 13,18, -1) # w = 20
    d1.number = 1

    self.maps << d1.map
  end
end

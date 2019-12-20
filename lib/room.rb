class Room < Thing
  attr_accessor :n, :s, :e, :w, :enemies, :exits

  def self.create(room_hash)
    r = self.new
    r.n = room_hash[:n]
    r.s = room_hash[:s]
    r.e = room_hash[:e]
    r.w = room_hash[:w]
    r.description = room_hash[:description]
    r.inventory = room_hash[:inventory]
    r.enemies = room_hash[:enemies]
    r
  end

  def self.map
    @@MAP
  end
end
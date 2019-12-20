class Room < Thing
  attr_accessor :n, :s, :e, :w, :enemies

  def self.create(name, n, s, e, w, description = nil)
    r = self.new
    r.name = name
    r.n = n
    r.s = s
    r.e = e
    r.w = w
    r.description = description
    r.enemies = []
    r
    # self.map << r
  end

  # def self.create_map
  # end

  def self.map
    @@MAP
  end
end
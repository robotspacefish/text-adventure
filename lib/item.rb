class Item < Thing

  @@all = []

  def self.all
    @@all
  end

  def self.create_item(type, description = nil)
    i = self.new
    i.type = type
    i.description = description

    self.all << i
    i
  end

  def self.create_sword
    self.create_item("sword", "an old, rusted sword" )
  end

  def self.create_gold
    self.create_item("gold", "a piece of gold")
  end
end
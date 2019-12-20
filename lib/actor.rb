class Actor < Thing
  attr_accessor :inventory, :gold

  def initialize(location)
    @location = location
    @inventory = []
    @gold = []
  end

  def drop(item)
    self.inventory.delete(item)
  end

  def total_gold
    self.gold.length
  end

end
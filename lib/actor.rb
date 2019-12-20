class Actor < Thing
  attr_accessor :location, :inventory
  attr_reader :type

  def initialize(location)
    @location = location
    @inventory = []
  end

  def drop(item)
    self.inventory.delete(item)
  end

end
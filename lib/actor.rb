class Actor < Thing
  def self.create
    a = self.new
    a.location = location
    a
  end

  def drop(item)
    self.inventory.delete(item)
  end
end
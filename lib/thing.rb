class Thing
  attr_accessor :name, :description, :location, :type, :gold, :inventory

  def initialize
    @gold = []
    @inventory = []
  end

  def total_gold
    self.gold.length
  end
end
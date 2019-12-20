class Player < Actor
  def initialize(location)
    super
    @type = 'player'
  end

  def take(item)
    self.inventory << item
  end

  def drop(item)
    super
    "You dropped #{item}."
  end
end
class Enemy < Actor
  def initialize(type = nil)
    super
    @type = type
  end

  def drop(item)
    super
    puts "The #{self.type} dropped the #{item}."
  end
end
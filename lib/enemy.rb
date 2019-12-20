class Enemy < Actor
  @@all = []
  attr_accessor :type

  def initialize(location)
    super
  end

  def self.all
    @@all
  end

  def drop(item)
    super
    puts "The #{self.type} dropped the #{item}."
  end
end
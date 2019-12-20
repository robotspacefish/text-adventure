class Actor < Thing
  attr_accessor :location

  def initialize(location)
    @location = location
  end

end
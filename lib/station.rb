class Station

  attr_reader :name, :zone

  def initialize(name, zone = rand(8))
    @name = name
    @zone = zone
  end

end

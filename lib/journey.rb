class Journey

  attr_reader :entry_station, :exit_station, :journeys

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  def create_journey
    last_journey = Hash.new
    last_journey[:entry_station] = @entry_station
    last_journey[:exit_station] = @exit_station
    @journeys << last_journey
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def in_journey?                                         #####
    if @entry_station == nil then false else true end
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end
end

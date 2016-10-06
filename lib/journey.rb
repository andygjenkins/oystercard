class Journey

  attr_reader :entry_station, :exit_station, :journeys

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = []
  end

  def create_journey
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def in_journey?                                         #####
    @entry_station != nil ? true : false
  end
  
  def journey_incomplete?
    @entry_station == nil || @exit_station == nil
  end

  def reset
    @entry_station = nil && @exit_station = nil
  end

  def complete_journey
    create_journey
    reset
  end
end

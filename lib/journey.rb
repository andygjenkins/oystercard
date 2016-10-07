class Journey

  attr_reader :entry_station, :exit_station, :fare

  PENALTY_FARE = 6

  def initialize(station = nil)
    @entry_station = station
    @complete = false
    @fare = PENALTY_FARE
  end

  def finish(station)
    self
  end

  def complete?
    @complete
  end
end


class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  attr_reader :entry_station, :fare, :exit_station

  def initialize(station=nil)
    @entry_station = station
    @fare = PENALTY_FARE
    @complete = false
  end

  def finish(station)
    @fare = MIN_FARE if entry_station
    @complete = true
    @exit_station = station
    self
  end

  def complete?
    @complete
  end

end

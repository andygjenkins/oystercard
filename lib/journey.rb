class Journey

  attr_reader :entry_station, :exit_station

 def initialize(entry_station = nil, exit_station = nil)
   @entry_station = entry_station
   @exit_station = exit_station
 end

end
=begin
  def create_journey
    last_journey = Hash.new
    last_journey[:entry_station] = @entry_station
    last_journey[:exit_station] = @exit_station
    @journeys << last_journey
    end

    def deduct(amount)
      @balance -= amount
    end

    def reset
      @entry_station = nil
      @exit_station = nil
    end
=end

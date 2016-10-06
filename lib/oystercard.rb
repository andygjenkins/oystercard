class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAXIMUM_BALANCE = 90
  TRAVEL_COST = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil      ####
    @exit_station = nil       ####
    @journeys = []            ####
    
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?                                         #####
    if @entry_station == nil then false else true end
  end

  def touch_in(station)
    fail 'Insufficient funds, please top up' if TRAVEL_COST > @balance
    @entry_station = station
  end

  def touch_out(station)
    deduct(TRAVEL_COST)
    @exit_station = station
    create_journey
    reset
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
  def create_journey                    ####
    last_journey = Hash.new
    last_journey[:entry_station] = @entry_station
    last_journey[:exit_station] = @exit_station
    @journeys << last_journey
    end
    
  def reset                   ####
    @entry_station = nil
    @exit_station = nil
  end
end
class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  TRAVEL_COST = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    if @entry_station == nil then false else true end
  end

  def touch_in(station)
    fail 'Insufficient funds, please top up' if TRAVEL_COST > @balance
    @entry_station = station
  end

  def touch_out
    deduct(TRAVEL_COST)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

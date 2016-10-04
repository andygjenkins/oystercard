class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90
  TRAVEL_COST = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insufficient funds, please top up' if TRAVEL_COST > @balance
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end

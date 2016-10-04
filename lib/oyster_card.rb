class Oystercard

  DEFAULT_BALANCE = 0.0
  MAX_BALANCE = 90
  MINIMUM_FARE = 1


  attr_reader :balance, :start_station

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end


  def topup(funds)
    fail "Error, this will exceed the £#{MAX_BALANCE} maximum balance." if (balance + funds) > MAX_BALANCE
    @balance = @balance + funds
  end


  def touch_in(station)
    @start_station = station
    fail "Not enough funds on card." if @balance < MINIMUM_FARE
  end

  def touch_out
    @start_station = nil
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    !!@start_station
  end

  private

  def deduct(amount)
    @balance = @balance - amount
  end

end

require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  MAXIMUM_BALANCE = 90
  TRAVEL_COST = 1
  PENALTY_FARE = 6

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds, please top up' if TRAVEL_COST > @balance
    journey.start(station)
  end

  def touch_out(station)
    deduct(TRAVEL_COST)
    journey.complete_journey(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

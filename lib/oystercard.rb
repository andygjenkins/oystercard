require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey, :journey_log

  MAXIMUM_BALANCE = 90
  TRAVEL_COST = 1
  PENALTY_FARE = 6

  def initialize(balance = 0, journey = Journey.new, journey_log = JourneyLog.new)
    @balance = balance
    @journey = journey
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "Card limit of £#{MAXIMUM_BALANCE} has been reached." if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Insufficient funds, please top up' if TRAVEL_COST > @balance
    journey.in_journey? ? deduct(fare) : start_journey(station)
  end

  def touch_out(station)
    finish_journey(station)
    deduct(fare)
    journey.complete_journey
    journey_log.complete_journey
  end

  def start_journey(station)
    journey.start(station)
    journey_log.start(station)
  end

  def finish_journey(station)
    journey.finish(station)
    journey_log.finish(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def fare
   journey.journey_incomplete? ? PENALTY_FARE : TRAVEL_COST
  end
end

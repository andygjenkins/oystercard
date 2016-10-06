require 'spec_helper'

describe JourneyLog do

  let(:card) { Oystercard.new(10) }
  let(:station)  { double(:station) }
  let(:exit_station) { double(:station, :exit_station => :nil) }
  let(:journey){ { entry_station: station, exit_station: exit_station} }

  it 'checks that touching in and out creates one journey' do
    card.touch_in(station)
    card.touch_out(exit_station)
    expect(card.journey_log.journeys).to include journey
  end
  
  describe '#start' do
    
    it 'starts a journey' do
      card.touch_in(station)
      expect(card.journey_log.entry_station).to eq station
    end
  end
end

require 'spec_helper'

describe Journey do

  let(:card) { Oystercard.new }
  let(:station)  {   double(:station)  }
  let(:exit_station) {double(:station, :exit_station => :nil) }
  let(:journey){ {entry_station: station, exit_station: exit_station} }


  describe '#initizalization' do
    
    it 'should return nil if no arguments are passed to it' do
      expect(card.journey.entry_station).to eq nil
      expect(card.journey.exit_station).to eq nil
    end
    
     it 'tests that the journeys array is empty by default' do
      expect(card.journey.journeys).to be_empty
    end
  end


  describe '#in_journey?' do

    it 'expects in_journey to equal false be default' do
      expect(card.journey.in_journey?).to be false
    end

    it 'is expected to check status based on entry station' do
      card.top_up(10)
      card.touch_in(station)
      expect(card.journey.in_journey?).to be true
    end
  end

  it 'checks that touching in and out creates one journey' do
    card.top_up(10)
    card.touch_in(station)
    card.touch_out(exit_station)
    expect(card.journey.journeys).to include journey
  end
end
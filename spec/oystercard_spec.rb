require 'spec_helper'

describe Oystercard do

  subject(:card) { Oystercard.new(10) }
  let(:station)  {   double(:station)  }
  let(:exit_station) {double(:station, :exit_station => :nil) }
  let(:journey){ {entry_station: station, exit_station: exit_station} }


  describe '#initialization' do

    it 'has a default balance of 0' do
      expect((Oystercard.new).balance).to eq 0
    end
  end


  describe '#top_up' do

    it 'allows a user to top-up their oystercard' do
      expect {card.top_up(40)}.to change{card.balance}.by(40)
    end
  end

  it 'will raise an error if maximum card value is reached' do
    card.top_up(described_class::MAXIMUM_BALANCE - 10)
    expect{ card.top_up(1) }.to raise_error "Card limit of £#{described_class::MAXIMUM_BALANCE} has been reached."
  end
  

  describe '#touch_in' do

    it 'expects touch_in to change the status of in_journey to true' do
      card.touch_in(station)
      expect(card.journey.in_journey?).to eq true
    end

    it 'is exected to remember the entry station' do
      card.touch_in(station)
      expect(card.journey.entry_station).to be station
    end

    it 'should raise an error if you don\'t have balance for travel' do
      expect {(Oystercard.new).touch_in(station) }.to raise_error 'Insufficient funds, please top up'
    end
  end


  describe '#touch_out' do
    
    it 'expects touch_out to change the status of in_journey to false' do
      card.touch_out(exit_station)
      expect(card.journey.in_journey?).to eq false
    end

    it 'should forget entry station on touch out' do
      card.touch_in(station)
      card.touch_out(exit_station)
      expect(card.journey.entry_station).to eq nil
    end

    it 'should deduct the cost of the journey from the user\'s card' do
      card.touch_in(station)
      expect {card.touch_out(exit_station)}.to change{card.balance}.by(-described_class::TRAVEL_COST)
    end
  end
end

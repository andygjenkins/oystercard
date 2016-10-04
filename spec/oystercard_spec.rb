require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:station)  {   double(:station)  }
  let(:exit_station) {double(:station, :exit_station => :nil) }
  let(:journey){ {entry_station: station, exit_station: exit_station} }

  describe '#initialization' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end
    
    it 'tests that the journeys array is empty by default' do
      expect(card.journeys).to be_empty
      end
  end

  describe '#top_up' do
  it 'allows a user to top-up their oystercard' do
    card.top_up(40)
    expect(card.balance).to eq 40
  end
  end

  describe '#deduct' do
  it 'allows a fare to be deducted from their oystercard' do
    card.top_up(40)
    card.send(:deduct, (10))
    expect(card.balance).to eq 30
  end

  it 'will raise an error if maximum card value is reached' do
    maximum_balance = described_class::MAXIMUM_BALANCE
    card.top_up(maximum_balance)
    message = "Card limit of £#{maximum_balance} has been reached."
    expect{ card.top_up(1) }.to raise_error message
  end
  end

  describe '#in_journey?' do
    it 'expects in_journey to equal false be default' do
    expect(card.in_journey?).to be false
    end

    it 'is expected to check status based on entry station' do
      card.top_up(10)
      card.touch_in(station)
      expect(card.in_journey?).to be true
    end
  end

  describe '#touch_in' do
    it 'expects touch_in to change the status of in_journey to true' do
    card.top_up(10)
    card.touch_in(station)
    expect(card.in_journey?).to eq true
    end

    it 'is exected to remember the entry station' do
      card.top_up(10)
      card.touch_in(station)
      expect(card.entry_station).to be station
   end

    it 'should raise an error if you don\'t have balance for travel' do
      expect { subject.touch_in(station) }.to raise_error 'Insufficient funds, please top up'
    end
  end

  describe '#touch_out' do
    it 'expects touch_out to change the status of in_journey to false' do
    card.touch_out(exit_station)
    expect(card.in_journey?).to eq false
    end
    
    it 'checks that touching in and out creates one journey' do
      card.top_up(10)
      card.touch_in(station)
      card.touch_out(exit_station)
      expect(card.journeys).to include journey
    end

    it 'should forget entry station on touch out' do
      card.top_up(10)
      card.touch_in(station)
      card.touch_out(exit_station)
      expect(card.entry_station).to eq nil
    end
  end

    it 'should deduct the cost of the journey from the user\'s card' do
      card.top_up(40)
      card.touch_in(station)
      expect {card.touch_out(exit_station)}.to change{card.balance}.by(-described_class::TRAVEL_COST)
    end
end

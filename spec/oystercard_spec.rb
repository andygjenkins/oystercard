require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe '#initialization' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
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
    card.deduct(10)
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
    expect(card.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'expects touch_in to change the status of in_journey to true' do
    card.top_up(10)
    card.touch_in
    expect(card.in_journey?).to eq true
    end

    it 'should raise an error if you don\'t have balance for travel' do
      expect { subject.touch_in }.to raise_error 'Insufficient funds, please top up'
    end
  end

  describe '#touch_out' do
    it 'expects touch_out to change the status of in_journey to false' do
    card.touch_out
    expect(card.in_journey?).to eq false
    end
  end

end

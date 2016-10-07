require 'spec_helper'

describe Journey do

  subject(:journey) { Journey.new }
  let(:station)  {   double(:station)  }


  describe 'initizalization' do
    it 'knows if a journey is not complete' do
      expect(journey).not_to be_complete
     end

    it 'has a penalty fare by default' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

  describe '#finish' do
    it 'returns itself when exiting a journey' do
      expect(journey.finish(station)).to eq journey
    end
  end

  context 'given an entry_station' do
    subject(:journey) { Journey.new(station) }

    it 'has an entry station' do
      expect(journey.entry_station).to eq station
    end
  end
end

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
end




=begin
  describe '#initizalization' do
    
    it 'should return nil if no arguments are passed to entry_station' do
      expect(card.journey.entry_station).to eq nil
    end
    
    it 'should return nil if no arguments are passed to exit_station' do
      expect(card.journey.exit_station).to eq nil
    end
    
  end


  describe '#in_journey?' do

    it 'expects in_journey to equal false be default' do
      expect(card.journey.in_journey?).to be false
    end

    it 'is expected to check status based on entry station' do
      card.touch_in(station)
      expect(card.journey.in_journey?).to be true
    end
  end
=end
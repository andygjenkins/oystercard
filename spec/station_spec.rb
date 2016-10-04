require 'station'

describe Station do

   subject(:station) { described_class.new(:Waterloo, 4)}

  describe '#initizalization' do
    
    it 'is expected to have a name' do
      expect(station.name).to be :Waterloo
    end

    it 'is expected to have a zone' do
      expect(station.zone).to be 4
    end

  end

end

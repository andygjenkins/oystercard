require 'spec_helper'

describe Station do

  subject(:station) { Station.new(name: "Waterloo", zone: 4) }


  describe '#initialization' do

    it 'is expected to have a name' do
      expect(station.name).to eq "Waterloo"
    end

    it 'is expected to have a zone' do
      expect(station.zone).to eq 4
    end
  end
end

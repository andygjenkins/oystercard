require 'journey'

describe Journey do

  subject(:journey) {described_class.new}

  describe '#initizalization' do
    it 'should return nil if no arguments are passed to it' do
      expect(subject.entry_station).to eq nil
      expect(subject.exit_station).to eq nil
    end
  end



end

require 'journey_log'


describe JourneyLog do

  let(:journey){ double :journey }
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class)}


  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end
  end

end

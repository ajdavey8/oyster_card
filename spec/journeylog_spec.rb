require 'journeylog'

describe JourneyLog do
  let(:entry_station) { :entry_station }
  describe '#start' do
    it 'starts a new journey with an entry station' do
      expect(subject.start(entry_station)).to eq(entry: entry_station)
    end
  end
  describe '#finish' do
    it 'finishes '
  end
end

require 'station'

describe Station do
  describe "#initialize" do
    context "when station is initialized" do
      station = Station.new('Euston', 1)
      it 'shows Euston as name' do
        expect(station.name).to eq('Euston')
      end
      it 'shows 1 as zone number' do
        expect(station.zone).to eq(1)
      end
    end
  end

  describe "# "
end

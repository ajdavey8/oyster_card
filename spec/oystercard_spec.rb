require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:oystercard_with_money) { Oystercard.new(5) }
  let(:station) {:station}

  describe "new card" do
    it "starts with empty list of journeys" do
      expect(oystercard.journey.journeys).to be_empty
    end
  end

  describe "#top_up" do
    it 'Top up oyster card by specified amount passing an argument' do
      expect(oystercard.top_up(5)).to eq oystercard.balance
    end

    it 'Raises error if balance goes over the limit' do
      oyster = Oystercard.new(90)
      error = "Can't top-up over the balance limit of £#{Oystercard::LIMIT}"
      expect { oyster.top_up(1) }.to raise_error error
    end
  end

  describe "#touch_in" do
    # it 'raises an error if trying to touch in when already in journey' do
    #   oystercard_with_money.touch_in(station)
    #   expect { oystercard_with_money.touch_in(station) }.to raise_error "Can't touch in if in journey"
    # end
    it 'raises an error if touched in with insufficent funds' do
      expect { oystercard.touch_in(station) }.to raise_error "Sorry insufficent funds for journey"
    end
    it 'remembers station after touch in' do
      oystercard_with_money.touch_in(station)
      expect(oystercard_with_money.journey.entry_station).to eq (station)
    end
  end

  describe "#touch_out" do
    # it 'raises an error if trying to touch in when already in journey' do
    #   expect { oystercard.touch_out(station) }.to raise_error "Can't touch out if not touched in"
    # end
    it "when touch out reduce balance by minimum fare" do
      oystercard_with_money.touch_in(station)
      expect {oystercard_with_money.touch_out(station)}.to change{oystercard_with_money.balance}.by(-Journey::MINIMUM)
    end
    it "stores a journey after touching out" do
      oystercard_with_money.touch_in(station)
      oystercard_with_money.touch_out(station)
      expect(oystercard_with_money.journey.journeys).to include({entry: station, exit: station})
    end
  end

  it 'Returns the default 0 balance of oystercard' do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
  end
end

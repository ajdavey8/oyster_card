require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it "Returns the default 0 balance of oystercard" do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  it "Top up oyster card by specified amount passing an argument" do
    expect(oystercard.top_up(5)).to eq oystercard.balance

  end

end

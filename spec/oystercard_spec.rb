require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it "Returns the default 0 balance of oystercard" do
  expect(oystercard.balance).to eq 0
  end
end

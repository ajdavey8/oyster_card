require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'Returns the default 0 balance of oystercard' do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  it 'Top up oyster card by specified amount passing an argument' do
    expect(oystercard.top_up(5)).to eq oystercard.balance
  end

  it 'Raises error if balance goes over the limit' do
    oyster = Oystercard.new(90)
    error = "Can't top-up over the balance limit of £#{Oystercard::LIMIT}"
    expect { oyster.top_up(1) }.to raise_error error
  end

  it 'Deduct oyster card by specified amount passing an argument' do
    expect(oystercard.deduct(5)).to eq oystercard.balance
  end

  it 'Confirm the oyster is touched in' do
    expect(oystercard.touch_in).to eq true
  end
end

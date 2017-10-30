require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:oystercard_with_money) { Oystercard.new(5) }

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
    expect(oystercard_with_money.touch_in).to eq true
  end

  it 'Confirm the oyster is touched out' do
    oystercard_with_money.touch_in
    expect(oystercard_with_money.touch_out).to eq false
  end

  it 'raises an error if trying to touch in when already in journey' do
    oystercard_with_money.touch_in
    expect { oystercard_with_money.touch_in }.to raise_error "Can't touch in if in journey"
  end

  it 'raises an error if trying to touch in when already in journey' do
    expect { oystercard.touch_out }.to raise_error "Can't touch out if not touched in"
  end

  it 'raises an error if touched in with insufficent funds' do
    expect { oystercard.touch_in}.to raise_error "Sorry insufficent funds for journey"
  end
end

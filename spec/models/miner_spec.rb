require 'rails_helper'

RSpec.describe Miner, type: :model do
  it 'has a valid "Miner" factory' do
    expect(build(:miner)).to be_valid
  end

  it 'has a hash_rate' do
    miner = build(:miner)

    expect(miner.hash_rate).not_to be_nil
  end

  it 'has a consumption' do
    miner = build(:miner)

    expect(miner.consumption).not_to be_nil
  end

  it 'has a price' do
    miner = build(:miner)

    expect(miner.price).not_to be_nil
  end
end

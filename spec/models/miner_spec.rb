require 'rails_helper'

RSpec.describe Miner, type: :model do
  before do
    @user = create(:user)
  end
  it 'has a valid "Miner" factory' do
    expect(build(:miner, user_id: @user.id)).to be_valid
  end

  it 'has a hash_rate' do
    miner = build(:miner, user_id: @user.id)

    expect(miner.hash_rate).not_to be_nil
  end

  it 'has a consumption' do
    miner = build(:miner, user_id: @user.id)

    expect(miner.consumption).not_to be_nil
  end

  it 'has a price' do
    miner = build(:miner, user_id: @user.id)

    expect(miner.price).not_to be_nil
  end

  describe 'Assosciation with User' do
    it 'belongs to a user' do
      miner = create(:miner, user_id: @user.id)

      expect(@user.miners).to include(miner)
    end
  end
end

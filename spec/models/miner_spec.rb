require 'rails_helper'

RSpec.describe Miner, type: :model do
  before do
    @user = create(:user)
  end
  it 'has a valid "Miner" factory' do
    expect(build(:miner)).to be_valid
  end

  it 'has a hash rate' do
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

  describe 'Assosciations' do
    it 'belongs to a mining rig through a join table' do
      mining_rig = create(:mining_rig, user_id: @user.id)
      miner = create(:miner)
      create(
        :mining_rig_miner,
        mining_rig_id: mining_rig.id,
        miner_id: miner.id
      )

      expect(mining_rig.miners).to include(miner)
    end
  end
end

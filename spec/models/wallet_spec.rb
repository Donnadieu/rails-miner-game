require 'rails_helper'

RSpec.describe Wallet, type: :model do
  before do
    @user = create(:user)
    @wallet = create(:wallet, user_id: @user.id)
  end
  it 'has a valid "Wallet" factory' do
    expect(@wallet).to be_valid
  end

  it 'has a "limit" attribute' do
    expect(@wallet.limit).to_not be_nil
    expect(@wallet.limit).to be_instance_of(Float)
  end

  describe 'Assosciations' do
    it 'has many coins' do
      expect(@wallet.coins.build).to be_instance_of(Coin)
    end
    it 'belongs to a User' do
      expect(@wallet.user).to be_instance_of(User)
      expect(@wallet.user_id).to eq(@user.id)
    end
  end
end

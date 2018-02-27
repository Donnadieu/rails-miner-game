class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    wallet = Wallet.find_or_create_by(address: Wallet.create_address, user_id: current_user.id)
    Coin.find_or_create_by(wallet_id: wallet.id)
  end

  def update
    super
  end
end

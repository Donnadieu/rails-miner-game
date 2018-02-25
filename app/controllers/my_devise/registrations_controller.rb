class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    Wallet.find_or_create_by(limit: 5000, address: Wallet.create_address, user_id: current_user.id)
  end

  def update
    super
  end
end

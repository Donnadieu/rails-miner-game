class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    current_user.wallet = Wallet.create(limit: 5000, address: Wallet.create_address)
    binding.pry
  end

  def update
    super
  end
end

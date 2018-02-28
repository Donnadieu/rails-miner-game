class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    redirect_to '/users'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password)
    end
  end

  def enough_balance?(price)
    current_user.balance >= price
  end

  def enough_energy?(miners)
    total_e = 0
    miners.each do |miner|
      total_e += miner.day_consumption
    end
    current_user.energy >= total_e
  end

  def sell_coin(coin, amount)
    if coin.amount >= amount
      coin.amount -= coin.amount
      current_user.balance = current_user.balance + (amount * coin.price)
      coin.save
      current_user.save
    else
      flash[:message] = "You do not have enough #{coin.name}"
    end
    redirect_to user_wallet_path(coin.wallet.id, current_user.id)
  end

  def start_mining(miners)
    coin = current_user.wallet.coin
    miners.each { |miner| miner.mining(coin) }
  end
end

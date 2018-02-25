class CoinsController < ApplicationController
  def update
    coin = set_coin
    amount = params[:coin][:amount].to_f
    if coin.amount >= amount
      coin.amount = coin.amount - amount
      current_user.balance = current_user.balance + (amount * coin.price.to_f)
      coin.save
      current_user.save
    else
      flash[:message] = "You do not have enough #{coin.name}"
    end
    redirect_to user_wallet_path(coin.wallet.id, current_user.id)
  end

  private

  def coin_params
    params.require(:coin).permit(:amount)
  end

  def set_coin
    Coin.find(params[:id])
  end
end

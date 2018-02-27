class CoinsController < ApplicationController
  def update
    coin = set_coin
    amount = params[:coin][:amount].to_f
    sell_coin(coin, amount)
  end

  private

  def coin_params
    params.require(:coin).permit(:amount)
  end

  def set_coin
    Coin.find(params[:id])
  end
end

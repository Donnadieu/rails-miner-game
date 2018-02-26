class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    @coins = @wallet.coins
  end
end

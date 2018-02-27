class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    @coin = @wallet.coin
  end
end

class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    @balance = current_user.wallet.balance
  end
end

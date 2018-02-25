class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
  end
end

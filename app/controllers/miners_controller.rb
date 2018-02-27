class MinersController < ApplicationController
  def update
    @miner = set_miner
    @coin = current_user.wallet.coin

    if enough_energy?(@miner)
      @miner.start_mining(@coin)
      flash[:message] = 'Great come back in 24 hours to see your BTC'
    else
      flash[:message] = "You don't have enough Energy"
    end
    redirect_to user_mining_rig_path(current_user)
  end


  private

  def miner_params
    params.require(:miner).permit(:id, :user_id)
  end

  def set_miner
    Miner.find(params[:id])
  end
end

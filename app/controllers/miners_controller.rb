class MinersController < ApplicationController
  def update
    # binding.pry
    @miner = set_miner
    @coin = current_user.wallet.coin

    if enough_energy?(@miner)
      @miner.start_mining(@coin)
    else
      flash[:message] = "You don't have enough Energy"
      redirect_to user_mining_rig_path(current_user)
    end
  end


  private

  def miner_params
    params.require(:miner).permit(:id, :user_id)
  end

  def set_miner
    Miner.find(params[:id])
  end
end

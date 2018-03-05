class MinersController < ApplicationController
  def update
    @mining_rig = MiningRig.find(params[:id])
    @miners = @mining_rig.miners


    if enough_energy?(@miners)
      start_mining(@miners)
      @mining_rig.change_status
      flash[:success] = 'Great your miner have started mining come back in 24 hours to see your BTC'
    else
      flash[:error] = "You don't have enough Energy"
    end
    redirect_to user_mining_rigs_path(current_user)
  end


  private

  def miner_params
    params.require(:miner).permit(:id, :user_id)
  end
end

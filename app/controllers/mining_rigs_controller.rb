class MiningRigsController < ApplicationController
  def index
    @mining_rigs = current_user.mining_rigs
  end

  def new
    @mining_rig = MiningRig.new
  end

  def create
    @mining_rig = MiningRig.new(mining_rig_params)
    @mining_rig.user = current_user
    @miner = @mining_rig.miners.last

    if @miner.valid_hashrate?(@miner.hash_rate) && enough_balance?(@miner.price(@miner.hash_rate))
      @miner.consumption = @miner.get_consumption(@miner.hash_rate)
      current_user.balance = current_user.balance - @miner.price(@miner.hash_rate)
    end
    if @mining_rig.save
      flash[:message] = 'You succesfully created a Miner for your Mining Rig'
      redirect_to user_mining_rigs_path(current_user)
    else
      flash[:message] = @mining_rig.errors.full_messages
      render :new
    end
  end

  def edit
    @mining_rig = set_mining_rig
    @miners = @mining_rig.miners
  end

  private

  def mining_rig_params
    params.require(:mining_rig).permit(:name, :user_id,  :miners_attributes => [:hash_rate])
  end

  def set_mining_rig
    MiningRig.find(params[:id])
  end
end

class MiningRigsController < ApplicationController
  def index
  end

  def new
    @mining_rig = MiningRig.new
  end

  def create
    @mining_rig = MiningRig.new(mining_rig_params)
    @mining_rig.user = current_user
    @miner = @mining_rig.miners.last

    if @miner.hash_rate == 14
      @miner.consumption = 1300.00
      current_user.balance = current_user.balance - 1000.00
    elsif @miner.hash_rate == 7
      @miner.consumption = 650.00
      current_user.balance = current_user.balance - 500.00
    elsif @miner.hash_rate == 3.5
      @miner.consumption = 325.00
      current_user.balance = current_user.balance - 250.00
    end
    binding.pry
    @mining_rig = MiningRig.new(mining_rig_params)
    @mining_rig.save
  end

  private

  def mining_rig_params
    params.require(:mining_rig).permit(:name, :user_id, :miners_ids => [], :miners_attributes => [:name, :hash_rate])
  end

  def set_mining_rig
    MiningRig.find(params[:id])
  end
end

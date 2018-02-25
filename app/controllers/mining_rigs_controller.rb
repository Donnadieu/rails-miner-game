class MiningRigsController < ApplicationController
  def index
  end

  def new
    @mining_rig = MiningRig.new
  end

  def create
    @mining_rig = MiningRig.new(mining_rig_params)
    @mining_rig.user = current_user
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

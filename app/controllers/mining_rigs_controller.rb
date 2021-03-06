class MiningRigsController < ApplicationController
  def index
    @mining_rigs = current_user.mining_rigs

  end

  def new
    @mining_rig = current_user.mining_rigs.build
    @mining_rig_miner = @mining_rig.mining_rig_miners.build
  end

  def create
    @mining_rig = current_user.mining_rigs.build(mining_rig_params)
    if @mining_rig.save
      @miner = @mining_rig.miners.last
      if enough_balance?(@miner.price)
        @miner.consumption = @miner.get_consumption
        current_user.balance -= @miner.price
        @miner.save
        current_user.save

        flash[:success] = 'You succesfully created a Miner for your Mining Rig'
        redirect_to user_mining_rigs_path(current_user)
      else
        flash[:error] = 'You do not have enough balance'
        render :new
      end
    else
      flash[:error] = @mining_rig.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @mining_rig = set_mining_rig
    @mining_rig_miner = @mining_rig.mining_rig_miners.build
  end

  def update
    @mining_rig = set_mining_rig
    if @mining_rig.update(mining_rig_params)
      @miner = @mining_rig.miners.last
      if !enough_balance?(@miner.price)
        flash[:error] = 'You do not have enough balance'
        redirect_to edit_user_mining_rig_path(current_user)
      else
        @miner.consumption = @miner.get_consumption
        current_user.balance -= @miner.price
        @miner.save
        current_user.save
        flash[:success] = 'Mining Rig succesfully updated'
        redirect_to user_mining_rigs_path(current_user)
      end
    else
      flash[:error] = @mining_rig.errors.full_messages.to_sentence
      redirect_to edit_user_mining_rig_path(current_user)
    end
  end

  def show
    @mining_rig = set_mining_rig
    @mining_rig_miners = @mining_rig.mining_rig_miners
  end

  private

  def mining_rig_params
    params.require(:mining_rig).permit(:name, :user_id, mining_rig_miners_attributes: [:hash_rate, :brand])
  end

  def set_mining_rig
    MiningRig.find(params[:id])
  end
end

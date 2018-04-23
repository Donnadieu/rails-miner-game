class MiningRigsController < ApplicationController
  def index
    @mining_rigs = current_user.mining_rigs

    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @mining_rigs, status: 200}
    end
  end

  def new
    @mining_rig = current_user.mining_rigs.build
    @mining_rig_miner = @mining_rig.mining_rig_miners.build
  end

  def create
    @mining_rig = current_user.mining_rigs.build(mining_rig_params)
    hash_rate = params["mining_rig"]["mining_rig_miners_attributes"]["0"]["hash_rate"].to_i

    if enough_balance?(hash_rate)
      if @mining_rig.save
        miner = @mining_rig.miners.last

        current_user.balance -= miner.price
        current_user.save

        flash[:success] = 'You succesfully created a Miner for your Mining Rig'
        redirect_to user_mining_rigs_path(current_user)

      else
        flash[:error] = @mining_rig.errors.full_messages.to_sentence
        render :new
      end
    else
      flash[:error] = 'You do not have enough balance'
      render :new
    end
  end

  def edit
    @mining_rig = set_mining_rig
    @mining_rig_miner = @mining_rig.mining_rig_miners.build
  end

  def update
    @mining_rig = set_mining_rig
    hash_rate = params["mining_rig"]["mining_rig_miners_attributes"]["0"]["hash_rate"].to_i

    if @mining_rig.update(mining_rig_params)
      @miner = @mining_rig.miners.last
      binding.pry
      if !enough_balance?(hash_rate)
        flash[:error] = 'You do not have enough balance'
        redirect_to edit_user_mining_rig_path(current_user)
      else
        @miner = @mining_rig.miners.last
        current_user.balance -= @miner.price
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

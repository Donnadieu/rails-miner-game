class EnergyPacksController < ApplicationController

  def index
    @energy_pack = EnergyPack.new

  end

  def create
    if current_user.balance >= 100.00
      @energy_pack = buy_energy_pack
      flash[:success] = 'You succesfully purchased energy!'
    else
      flash[:error] = 'You do not have enough balance!'
    end
    redirect_to energy_packs_path
  end
end

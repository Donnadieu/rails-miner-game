class EnergyPacksController < ApplicationController

  def index
    @energy_pack = EnergyPack.new

  end

  def create
    if current_user.balance >= 30.00
      @energy_pack = EnergyPack.create
      current_user.energy = @energy_pack.size
      current_user.balance = current_user.balance - @energy_pack.price
      current_user.save
      flash[:message] = "You succesfully purchased energy!!"
    else
      flash[:message] = "You do not have enough balance!!"
    end
    redirect_to energy_packs_path
  end
end

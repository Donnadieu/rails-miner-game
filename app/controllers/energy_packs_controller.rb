class EnergyPacksController < ApplicationController

  def index
    @energy_pack = EnergyPack.new
  end
end

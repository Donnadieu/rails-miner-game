class AddImageToEnergyPack < ActiveRecord::Migration[5.1]
  def change
    add_column :energy_packs, :image, :string, default: "https://orig00.deviantart.net/e2bc/f/2011/071/d/9/battery_icon_by_guitarcraze-d3bguey.png"
  end
end

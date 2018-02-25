class AddImageToEnergyPack < ActiveRecord::Migration[5.1]
  def change
    add_column :energy_packs, :image, :string, default: "https://boygeniusreport.files.wordpress.com/2017/02/battery.jpg?quality=98&strip=all&w=300"
  end
end

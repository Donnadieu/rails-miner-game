class AddBrandToMiningRigMiners < ActiveRecord::Migration[5.1]
  def change
    add_column :mining_rig_miners, :brand, :string
  end
end

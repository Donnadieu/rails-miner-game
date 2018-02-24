class CreateMiningRigMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :mining_rig_miners do |t|
      t.integer :mining_rig_id
      t.integer :miner_id

      t.timestamps
    end
  end
end

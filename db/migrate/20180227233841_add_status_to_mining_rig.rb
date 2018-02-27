class AddStatusToMiningRig < ActiveRecord::Migration[5.1]
  def change
    add_column :mining_rigs, :status, :boolean, default: false
  end
end

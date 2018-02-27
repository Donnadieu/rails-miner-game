class AddBlockRewardToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :block_reward, :float, default: 1250000000
  end
end

class AddBlockRewardToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :block_reward, :float
  end
end

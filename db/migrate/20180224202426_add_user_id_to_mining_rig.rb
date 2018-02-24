class AddUserIdToMiningRig < ActiveRecord::Migration[5.1]
  def change
    add_column :mining_rigs, :user_id, :integer
  end
end

class AddUserIdToMiner < ActiveRecord::Migration[5.1]
  def change
    add_column :miners, :user_id, :integer
  end
end

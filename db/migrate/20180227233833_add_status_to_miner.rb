class AddStatusToMiner < ActiveRecord::Migration[5.1]
  def change
    add_column :miners, :status, :boolean, default: false
  end
end

class AddNameToMiners < ActiveRecord::Migration[5.1]
  def change
    add_column :miners, :name, :string
  end
end

class CreateMiningRigs < ActiveRecord::Migration[5.1]
  def change
    create_table :mining_rigs do |t|
      t.string :name

      t.timestamps
    end
  end
end

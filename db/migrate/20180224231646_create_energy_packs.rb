class CreateEnergyPacks < ActiveRecord::Migration[5.1]
  def change
    create_table :energy_packs do |t|
      t.integer :size, default: 15600
      t.float :price, default: 30.00
      t.timestamps
    end
  end
end

class CreateEnergyPacks < ActiveRecord::Migration[5.1]
  def change
    create_table :energy_packs do |t|
      t.integer :size, default: 25
      t.float :price, default: 25.00
      t.timestamps
    end
  end
end

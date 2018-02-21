class CreateMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :miners do |t|
      t.float :consumption
      t.float :price
      t.float :hash_rate

      t.timestamps
    end
  end
end

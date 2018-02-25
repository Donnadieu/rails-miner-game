class CreateMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :miners do |t|
      t.float :consumption, default: 0.0
      t.float :price, default: 0.0
      t.float :hash_rate, default: 0.0

      t.timestamps
    end
  end
end

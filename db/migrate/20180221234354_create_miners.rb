class CreateMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :miners do |t|
      t.decimal :consumption, default: 0.0
      t.decimal :hash_rate, default: 0.0

      t.timestamps
    end
  end
end

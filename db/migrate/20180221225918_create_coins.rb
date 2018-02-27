class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :name, default: 'Bitcoin'
      t.string :symbol, default: "BTC"
      t.decimal :difficulty, default: 0.0
      t.decimal :amount, default: 0.0
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end

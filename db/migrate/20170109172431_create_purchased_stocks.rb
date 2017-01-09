class CreatePurchasedStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :purchased_stocks do |t|
      t.float :purchase_price, null: false
      t.integer :quantity, null: false
      t.string :stock_symbol, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

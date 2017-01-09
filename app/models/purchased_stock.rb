class PurchasedStock < ApplicationRecord
  validates_presence_of :purchase_price, :quantity, :stock_symbol
  belongs_to :user
end

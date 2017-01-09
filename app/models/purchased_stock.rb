class PurchasedStock < ApplicationRecord
  validates_presence_of :purchase_price, :quantity, :stock_symbol
  belongs_to :user

  def cost_basis
    self.purchase_price * self.quantity
  end

end

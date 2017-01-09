require 'rails_helper'

RSpec.describe PurchasedStock, type: :model do
  let!(:purchased_stock) {PurchasedStock.new(stock_symbol: "ARIA", purchase_price: 20.00, quantity: 5)}
  describe "#cost_basis" do
    it "calculates the cost_basis" do
      expect(purchased_stock.cost_basis).to eq 100.0
    end

  end
end

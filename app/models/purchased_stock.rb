class PurchasedStock < ApplicationRecord
  validates_presence_of :purchase_price, :quantity, :stock_symbol
  belongs_to :user

  def cost_basis
    self.purchase_price * self.quantity
  end

  def company_name
    portfolio = YahooFinance::Client.new
    stock = [self.stock_symbol]
    name = portfolio.quotes(stock, [:name])
    name[0].name 
  end 

  def last_trade_date
    portfolio = YahooFinance::Client.new
    stock = [self.stock_symbol]
    date = portfolio.quotes(stock, [:last_trade_date])
    date[0].last_trade_date
  end 

  def last_trade_time
    portfolio = YahooFinance::Client.new
    stock = [self.stock_symbol]
    time = portfolio.quotes(stock, [:last_trade_time])
    time[0].last_trade_time
  end 

  def last_trade_price
    portfolio = YahooFinance::Client.new
    stock = [self.stock_symbol]
    price = portfolio.quotes(stock, [:last_trade_price])
    price[0].last_trade_price
  end 

end

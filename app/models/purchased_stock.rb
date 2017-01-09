class PurchasedStock < ApplicationRecord
  validates_presence_of :purchase_price, :quantity, :stock_symbol
  belongs_to :user

  def cost_basis
    self.purchase_price * self.quantity
  end

  # Call the api and extract the stock info from the returned object
  def quote_hash
    portfolio = YahooFinance::Client.new
    stock = [self.stock_symbol]

    returned_instance = portfolio.quotes(stock, [:name, :last_trade_date, :last_trade_time, :last_trade_price])
    returned_instance[0]
  end

  # Call the api if it hasn't already been called, otherwise use returned values
  def quote
    @quote ||= quote_hash
  end 

  # Return full company name
  def company_name
    quote.name 
  end 

  # Return last trade date
  def last_trade_date
    quote.last_trade_date
  end 

  #Return time of last trade date
  def last_trade_time
    quote.last_trade_time
  end

  # Return ask price of last trade
  def last_trade_price
    quote.last_trade_price
  end

end

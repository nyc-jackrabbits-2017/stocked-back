module Ticker

  def portfolio
    YahooFinance::Client.new
  end

  def my_stocks
    self.purchased_stocks.collect { |company| company.stock_symbol }
  end

  def current_quotes
    portfolio.quotes(self.my_stocks, [:name, :symbol, :last_trade_date, :last_trade_time, :last_trade_price])
  end  

  def user_quotes_hash
    current_quotes.map do |quote| 
      quote.to_h
    end 
  end 

end 
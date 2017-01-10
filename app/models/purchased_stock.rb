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

    returned_instance = portfolio.quotes(stock, [:name, :last_trade_date, :last_trade_time, :last_trade_price, :ask])
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

  def ask
    quote.ask
  end


  # Returns an array of purchased_stock values of last year's data month by month
  def last_years_performance
    client = YahooFinance::Client.new
    quotes = client.historical_quotes(self.stock_symbol, {period: :monthly})
    last_years_quotes = quotes.select {|quote| quote.trade_date.include?(1.year.ago.year.to_s)}
    last_years_quotes.map {|quote| quote.close.to_f * quantity}.reverse
  end

  def serialize_purchase
    self.to_json(
      :include => [
        :user => {
          :only => [:id, :first_name, :last_name]
        }
      ],
      :methods => [
        :cost_basis,
        :ask,
        :company_name,
        :last_trade_date,
        :last_trade_time,
        :last_trade_price
      ]
    )

  end

end

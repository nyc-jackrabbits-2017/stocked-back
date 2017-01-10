class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchased_stocks
  validates :auth_token, uniqueness: true


  # Returns an array of portfolio values of last year's data month by month
  def last_year_portfolio_performance
    last_year_performance_all_stocks = self.purchased_stocks.reduce([]) do |result, stock|
      result << stock.last_years_performance
    end
    sum_for_each_month(last_year_performance_all_stocks)
  end

  def serialize_portfolio
    self.to_json(
      :only => [:id, :first_name, :last_name],
      :include => [
        :purchased_stocks =>
          { :methods => [
              :cost_basis,
              :ask,
              :company_name,
              :last_trade_date,
              :last_trade_time,
              :last_trade_price
            ]
          }
      ]
    )
  end

    private
    def sum_for_each_month(performance_of_all_stocks)
      monthly_values = performance_of_all_stocks.transpose
      monthly_values.map do |monthly_value|
        monthly_value.reduce(0) {|value, sum| value + sum}
    end

  end

end

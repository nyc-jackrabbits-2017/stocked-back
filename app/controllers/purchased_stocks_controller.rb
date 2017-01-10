class PurchasedStocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    portfolio = @user.serialize_portfolio
    render json: portfolio
  end

  def show
    @purchased_stock = PurchasedStock.find(params[:id])
    render json: @purchased_stock, methods: [:cost_basis, :ask, :company_name, :last_trade_date, :last_trade_time, :last_trade_price]
  end

end

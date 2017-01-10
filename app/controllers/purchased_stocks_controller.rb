class PurchasedStocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    render json: @user.purchased_stocks, methods: [:cost_basis, :ask, :company_name, :last_trade_date, :last_trade_time, :last_trade_price]
  end

  def show
    @purchased_stock = PurchasedStock.find(params[:id])
    render json: @purchased_stock, methods: [:cost_basis, :ask, :company_name, :last_trade_date, :last_trade_time, :last_trade_price]
  end

end

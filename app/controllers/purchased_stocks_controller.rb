class PurchasedStocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    portfolio = @user.serialize_portfolio
    render json: portfolio
  end

  def show
    @purchased_stock = PurchasedStock.find(params[:id])
    @purchased_stock_json = @purchased_stock.serialize_purchase
    render json: @purchased_stock_json
  end

end

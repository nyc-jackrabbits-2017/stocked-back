class Api::V1::PurchasedStocksController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  respond_to :json

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
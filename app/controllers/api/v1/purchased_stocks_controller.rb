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

  def create
    @user = User.find(params[:user_id])
    @purchased_stock = PurchasedStock.new(purchased_stock_params)
    @purchased_stock.user = @user
    if @purchased_stock.save
      render json: {saved: true}
    else
      render json: {saved: false, errors: @purchased_stock.errors.full_messages}
    end
  end


  def purchased_stock_params
    params.require(:purchased_stock).permit(:purchase_price, :quantity, :stock_symbol)
  end

end

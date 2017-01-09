class PurchasedStocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    render json: @user.purchased_stocks
  end
end

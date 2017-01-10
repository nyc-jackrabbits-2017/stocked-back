class PurchasedStocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    render json: {
      user_id: @user.id,
      user_name: "#{@user.first_name} #{@user.last_name}",
      portfolio: @user.purchased_stocks, methods: [
                                                    :cost_basis,
                                                    :ask,
                                                    :company_name,
                                                    :last_trade_date,
                                                    :last_trade_time,
                                                    :last_trade_price
                                                    ]
                                                  }
  end

  def show
    @user = User.find(params[:user_id])
    @purchased_stock = PurchasedStock.find(params[:id])
    render json: {
      user_id: @user.id,
      user_name: "#{@user.first_name} #{@user.last_name}",
      stock_data: @purchased_stock, methods: [
                                              :cost_basis,
                                              :ask,
                                              :company_name,
                                              :last_trade_date,
                                              :last_trade_time,
                                              :last_trade_price
                                              ]
                                            }
  end

end

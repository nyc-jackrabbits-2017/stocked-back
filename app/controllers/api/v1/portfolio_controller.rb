class Api::V1::PortfolioController < ApplicationController
  def last_year_portfolio_performance
    @user = User.find(params[:user_id])
    render json: @user.last_year_portfolio_performance
  end
end

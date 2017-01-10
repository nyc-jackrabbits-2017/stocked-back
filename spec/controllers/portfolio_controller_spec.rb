require 'rails_helper'

RSpec.describe PortfolioController, type: :controller do
  let!(:user) {User.create!(first_name: "Albert", last_name: "Farhi", email: "albert@aol.com", password: "password")}
  let!(:purchased_stock) {user.purchased_stocks.create!(stock_symbol: "ARIA", purchase_price: 23.71, quantity: rand(1..1000))}

  describe "GET #last_year_portfolio_performance" do
    it "responds with a status code of 200" do
      get :last_year_portfolio_performance, params: {user_id: user.id}
      expect(response).to have_http_status 200
    end
  end

end

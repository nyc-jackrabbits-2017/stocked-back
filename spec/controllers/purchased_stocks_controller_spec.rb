# require 'rails_helper'
#
# RSpec.describe PurchasedStocksController, type: :controller do
#   let!(:user) {User.create!(first_name: "Albert", last_name: "Farhi", email: "albert@aol.com", password: "password")}
#   let!(:purchased_stock) {user.purchased_stocks.create!(stock_symbol: "ARIA", purchase_price: 23.71, quantity: rand(1..1000))}
#
#   describe "GET #index" do
#     it "responds with a status code of 200" do
#       get :index, params: {user_id: user.id}
#       expect(response).to have_http_status 200
#     end
#     it "includes cost_basis in the response" do
#       get :index, params: {user_id: user.id}
#       expect(response.body).to include "cost_basis"
#     end
#   end
#   describe "GET #show" do
#     before (:each) do
#       get :show, params: {user_id: user.id, id: purchased_stock.id}
#     end
#
#     it "responds with a status code of 200" do
#       expect(response).to have_http_status 200
#     end
#
#     it "includes cost_basis in the response" do
#       expect(response.body).to include "cost_basis"
#     end
#   end
# end

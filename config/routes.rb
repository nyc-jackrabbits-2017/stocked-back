require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    scope module: :v1 do

      get '/search/stocks/:stock_symbol/history' => 'search#stock_history'
      get '/search/stocks/:stock_symbol' => 'search#stock_search'
      get '/search/:query' => 'search#symbol_search'

      resources :users, only: [:show, :create, :update, :destroy] do
        resources :purchased_stocks, only: [:index, :show]
        get 'last_year_portfolio_performance' => 'portfolio#last_year_portfolio_performance'
      end

      resources :sessions, :only => [:create, :destroy]

    end
  end

  get '/test/users', to: 'static#user_test'

end

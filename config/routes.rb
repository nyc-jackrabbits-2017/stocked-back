require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # root to: 'home#index'

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:show, :create, :update, :destroy] do
        resources :purchased_stocks, only: [:index, :show]
        get 'last_year_portfolio_performance' => 'portfolio#last_year_portfolio_performance'
      end
    end
  end
end

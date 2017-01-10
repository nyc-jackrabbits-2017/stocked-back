

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  namespace :api do
    resources :users, only: [:show, :create, :update] do
      resources :purchased_stocks, only: [:index, :show]
      get 'last_year_portfolio_performance' => 'portfolio#last_year_portfolio_performance'
    end
  end
end

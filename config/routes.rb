Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users, only: [] do
    resources :purchased_stocks, only: [:index, :show, :create]
    get 'last_year_portfolio_performance' => 'portfolio#last_year_portfolio_performance'
  end
end

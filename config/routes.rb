Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users, only: [] do
    resources :purchased_stocks, only: [:index, :show]
  end
end

Rails.application.routes.draw do
  get 'cards/new'
  get 'comments/new'
  get 'items/search'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
   resources :users, only: :show
   resources :cards, only: [:new, :create]
end

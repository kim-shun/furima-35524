Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  get 'cards/new'
  get 'comments/new'
  get 'items/search'
  
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
  end
   resources :users, only: [:new, :show]
   resources :cards, only: [:new, :create]
end

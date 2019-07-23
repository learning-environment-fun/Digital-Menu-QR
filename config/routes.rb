Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#show'

  #
  get "/tables/:id/orders/new", to ':orders#new'
  post "/tables/:id/orders", to 'orders#create'

resources :restaurants, only: [:show] do
  resources :items, only: [:show]
  resources :orders, only: [:show, :update, :destroy]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



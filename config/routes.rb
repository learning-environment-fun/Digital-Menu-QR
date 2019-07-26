Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home', as: 'homepage'

  # test routes for getting to specific views
  get "/cart", to: 'pages#cart', as: 'cart' 
  # get "/cart/:num", to: 'pages#cart', as: 'cart_with_quantity' 
  get "/pay", to: 'pages#pay', as: 'pay'
  get "/feedback/:id", to: 'pages#feedback', as: 'feedback' 

  resources :restaurants, only: [:index, :show]
  resources :items, only: [:show]
  post '/orders', to: 'orders#handle_order_json'
  get '/alt-restaurants/:id', to: 'restaurants#alt_show', as: 'alt_restaurant'
  
  #1 after scanning a new order will be created, than redicrection to 'show restaurants items'


  resources :tables, only: [] do | |
    resources :orders, only: [:create]
  end

#display the items of the restaurant
# restaurants/1
resources :orders, only: [:show, :update, :destroy] do

   member do                             # member => restaurant id in URL
      get 'menu'                          # RestaurantsController#chef
    end

  #display a specific item
  # restaurants/1/items/:id
  resources :items, only: [:show]
  #possibility to update/update/destroy
  # restaurants/1/items/:id/show
  resources :order_items, only: [:create]

 end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

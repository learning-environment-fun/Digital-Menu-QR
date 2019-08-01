Rails.application.routes.draw do

  devise_for :users

  get "/qrcode/:table_id", to: 'orders#create'

# <<<<<<< HEAD
# =======
#   scope 'kitchen' do
#     get 'orders/', to: 'kitchens#kitchen_orders'
#   end
#   root to: 'pages#home', as: 'homepage'

#   get "/qrcode/:table_id", to: 'orders#create'

#   # test routes for getting to specific views
#   get "/cart", to: 'pages#cart', as: 'cart'
#   # get "/cart/:num", to: 'pages#cart', as: 'cart_with_quantity'
#   get "/pay/:order_id", to: 'pages#pay', as: 'pay'
#   get "/feedback/:order_id", to: 'pages#feedback', as: 'feedback'



#   resources :restaurants, only: [:index, :show]
#   resources :items, only: [:show]
#   post '/orders', to: 'orders#handle_order_json'
#   get '/alt-restaurants/:id', to: 'restaurants#alt_show', as: 'alt_restaurant'

#   #1 after scanning a new order will be created, than redicrection to 'show restaurants items'
# >>>>>>> master


  root to: 'pages#home', as: 'homepage'

  #display the items of the restaurant
# orders resource in which we call rest:id restaurants/1
resources :orders, only: [:show, :update, :destroy] do

# Member is for one object; product user.. go here..
  member do                             # member => restaurant id in URL
      get 'menu'
      get "cart" #/orders/:id/cart
      get "pay", to: 'pages#pay' #as: 'pay_order_path'
    end

  #display a specific item on show page
  resources :items, only: [:show]   # restaurants/1/items/:id
  #possibility to update/update/destroy
  # restaurants/1/items/:id/show
  resources :order_items, only: [:create, :destroy]

  # Stripe stuff
  resources :payments, only: [:new, :create]

end

  # scope adds a prefix to the url; for customizing your url
  scope 'kitchens' do
    get 'orders/', to: 'kitchens#orders'
    get 'manager/', to: 'kitchens#manager'
  end

  # test routes for getting to specific views
  # get "/cart", to: 'pages#cart', as: 'cart'
  # get "/cart/:num", to: 'pages#cart', as: 'cart_with_quantity'
  # get "/pay/:order_id", to: 'pages#pay', as: 'pay'
  get "/feedback/:order_id", to: 'pages#feedback', as: 'feedback'



  resources :restaurants, only: [:index, :show]
  resources :items, only: [:show]
  post '/orders', to: 'orders#handle_order_json'
  # get '/alt-restaurants/:id', to: 'restaurants#alt_show', as: 'alt_restaurant'

  #1 after scanning a new order will be created, than redicrection to 'show restaurants items'
  resources :tables, only: [] do
    resources :orders, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Study up member, scoping, resources, collections and namespace(similar to scope)..

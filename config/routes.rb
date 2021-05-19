Rails.application.routes.draw do
  get 'customer/index'
  get 'customer/create'
  resources :product_reviews
  resources :shipmment_items
  resources :shipments
  resources :transactions
  resources :cart_items
  resources :carts
  resources :order_items
  resources :product_categories
  resources :orders
  resources :roles
  resources :user_addresses
  resources :products

  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'home#index'

  
  
end

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

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]
      #match '/request' => 'product#create', via: :post
    end
  end

  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'home#index' 
end

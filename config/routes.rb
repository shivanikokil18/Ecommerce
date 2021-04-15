Rails.application.routes.draw do
  resources :products
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'home#index'
  
end

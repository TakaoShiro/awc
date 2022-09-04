Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  
  namespace :admin do
    root to: 'homes/top'
    resources :sessions, only: [:new,:create,:destroy]
  end
  
  namespace :public do
    root to: 'homes/top'
    resources :rooms, only: [:show,:create]
    resources :customers, only: [:index,:show,:edit,:update]
    get "customers/unsubscribe"
    get "customers/withdraw"
    resources :sessions, only: [:new,:create,:destroy]
    resources :registrations, only: [:new,:create]
    resources :animals, only: [:index,:show]
    get 'homes/about'
  end
  
end
  
    
   
    
    
    
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

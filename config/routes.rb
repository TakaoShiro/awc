Rails.application.routes.draw do
devise_for :admins, skip: [:registrations, :passwords], controllers: {  
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}, path: "public"

  namespace :admin do
    root to: "homes#top"
    #resources :sessions, only: [:new,:create,:destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    #ゲストログイン機能
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    resources :rooms, only: [:show,:create]
    get "customers/unsubscribe"
    patch "customers/withdraw"
    resources :customers, only: [:index,:show,:edit,:update] do
      member do
        get :favorites
      end
    end
    get "search" => "searches#search"
    resources :sessions, only: [:new,:create,:destroy]
    resources :registrations, only: [:new,:create]
    resources :animals, only: [:new,:index,:show,:edit,:create,:update,:destroy] do
      resources :comments
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show,:edit,:update]
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
    get "homes/about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

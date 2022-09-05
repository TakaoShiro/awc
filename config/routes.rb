Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}, path: "public"

  namespace :admin do
    root to: "homes#top"
    resources :sessions, only: [:new,:create,:destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    resources :rooms, only: [:show,:create]
    resources :customers, only: [:index,:show,:edit,:update]
    get "customers/unsubscribe"
    get "customers/withdraw"
    resources :sessions, only: [:new,:create,:destroy]
    resources :registrations, only: [:new,:create]
    resources :animals, only: [:index,:show,:edit,:create,:update]
    get "homes/about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

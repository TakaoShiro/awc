Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  namespace :public do
    get 'rooms/show'
  end
  namespace :public do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/index'
    get 'registrations/show'
  end
  namespace :public do
    get 'animals/index'
    get 'animals/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

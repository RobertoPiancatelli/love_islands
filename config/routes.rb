Rails.application.routes.draw do
  devise_for :users
  root to: 'islands#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "my_bookings", to: 'bookings#my_bookings'
  get "my_islands", to: 'bookings#my_islands'
  resources :islands do
    resources :bookings, only: [:new, :create, :index]
     resources :reviews, only: [:show]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
    get "accept_booking", to: 'bookings#accept_booking'
    
  end
  resources :bookings, only: [:show] do
    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new]
    end
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new]
  end
end

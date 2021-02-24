Rails.application.routes.draw do
  devise_for :users
  root to: 'islands#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "my_bookings", to: 'bookings#my_bookings'
  resources :islands do
    resources :bookings, only: [:new, :create, :index]
     resources :reviews, only: [:show]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
end

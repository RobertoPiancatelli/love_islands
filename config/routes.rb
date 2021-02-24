Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "my_bookings", to: 'bookings#my_bookings'
  resources :islands do
    resources :bookings
     resources :reviews, only: [:new]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'islands#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :islands do
    resources :bookings
     resources :reviews, only: [:new]
  end
end

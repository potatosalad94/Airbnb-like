Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews
  end

  # get 'flats', to: 'flats#index', as: :flats

  resources :bookings, only: [:index] do
    get "accept", to: "bookings#accept_booking"
    get "decline", to: "bookings#decline_booking"
  end
end

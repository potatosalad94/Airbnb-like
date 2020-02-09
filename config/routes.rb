Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats, except: [:edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
    resources :reviews
  end

  resources :bookings, only: [:index] do
    get "accept", to: "bookings#accept_booking"
    get "decline", to: "bookings#decline_booking"
  end
end

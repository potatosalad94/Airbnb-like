Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats, except: [:edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]
end

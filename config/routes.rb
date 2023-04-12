Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # User routes
  resources :users, only: %i[show edit update]

  # Itineraries routes
  resources :itineraries, only: %i[index new create show edit update destroy]

  # Countries routes
  resources :countries, only: %i[index show]
end

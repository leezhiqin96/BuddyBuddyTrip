Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "pages#dashboard", as: :authenticated_root
  end

  # Default home page
  root to: "pages#home"

  # User routes
  resources :users, only: %i[show edit update]

  # Itineraries routes
  resources :itineraries, only: %i[index new create show edit update destroy]

  get '/search_countries', to: 'countries#search', as: :search_countries
end

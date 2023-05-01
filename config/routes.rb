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
  resources :itineraries, only: %i[index new create show edit update destroy] do
    resources :destinations, only: %i[create]
    resources :collaborations, only: %i[new create]
  end

  resources :destinations, only: %i[update destroy]
  resources :collaborations, only: %i[edit update destroy]

  get '/search_countries', to: 'countries#search', as: :search_countries
end

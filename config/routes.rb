Rails.application.routes.draw do
  resources :confirmations
  resources :addresses
  resources :profiles

  get :register, to: "accounts#new"
  post :register, to: "accounts#create"

  get :sign_in, to: "sessions#new"
  post :sign_in, to: "sessions#create"
  get :sign_out, to: "sessions#destroy"

  root to: "accounts#show"
end

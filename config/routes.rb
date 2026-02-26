Rails.application.routes.draw do
  get "rooms/index"
  get "rooms/new"
  get "rooms/create"
  get "rooms/show"
  root "rooms#index"

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :rooms

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
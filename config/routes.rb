Rails.application.routes.draw do
  root "rooms#index"

  resources :users, only: [:new, :create, :show, :edit, :update]

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
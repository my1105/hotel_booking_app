Rails.application.routes.draw do
  get "reservations/create"
  get "reservations/index"
  root "rooms#index"

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :reservations, only: [:index]

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
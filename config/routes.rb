Rails.application.routes.draw do
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users, only: [:new, :create, :edit, :update, :destroy]
end

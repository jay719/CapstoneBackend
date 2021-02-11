Rails.application.routes.draw do
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  post "login", to: "authentication#login"
end
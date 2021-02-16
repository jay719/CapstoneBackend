Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [:create, :index, :delete, :show]
  resources :users, only: [:create, :index, :show]
  post "login", to: "authentication#login"
end

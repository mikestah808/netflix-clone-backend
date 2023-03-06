Rails.application.routes.draw do
  
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  
  resources :movies, only: [:index, :create, :update, :destroy]
  resources :genres, only:[:index, :create]
 


end

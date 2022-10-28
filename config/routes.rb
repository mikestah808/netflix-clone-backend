Rails.application.routes.draw do
  
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/even_movie", to: "movies#even_movies"

  resources :movies, only: [:index, :create, :update, :destroy]
  resources :genres, only:[:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # create a button 
  # when the user clicks it, then console.log the movies that were released in even number years 
  # Ex: movies released in 1994 & 2000

  # create custom route, which would get a get request, path of "/even", to "movies#even"
end

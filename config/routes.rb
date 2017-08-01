Rails.application.routes.draw do
  resources :topics
  resources :ratings
  resources :offers
  resources :posts
  resources :reservations
  resources :users

  get '/', to: "sessions#welcome", as: "welcome"
  get '/signin', to: "sessions#new", as: "signin"
  post '/', to: "sessions#create", as: "login"
  delete '/', to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

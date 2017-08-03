Rails.application.routes.draw do
  resources :topics
  resources :ratings
  resources :offers
  resources :posts
  resources :reservations
  resources :users

  get '/', to: "sessions#welcome", as: "welcome"
  get '/signin', to: "sessions#new", as: "signin"
  post '/', to: "sessions#secret", as: "secret"
  delete '/', to: "sessions#destroy", as: "logout"
  get '/slack/auth', to: "sessions#create", as: "slack_login"

end

Rails.application.routes.draw do
  get 'posts/filter', to: "posts#index"
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
  post 'posts/filter', to: "posts#filter", as: "filter"

end

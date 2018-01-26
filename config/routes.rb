Rails.application.routes.draw do
  resources :incident_reports, only: [:show, :index, :new, :create]
  resources :cells, only: [:show]
  resources :cell_blocks, only: [:index, :show]
  resources :prisoners, only: [:index, :create, :show, :new]
  resources :guards, only: [:show, :new, :create]

  get "signup", to: "guards#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "leaderboard", to: "sessions#new", as: "leaderboard"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"

end

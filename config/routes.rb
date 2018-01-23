Rails.application.routes.draw do
  resources :incident_reports
  resources :cells, only: [:show]
  resources :cell_blocks, only: [:index, :show]
  resources :prisoners
  resources :guards

  get "signup", to: "guards#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"

end

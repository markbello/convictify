Rails.application.routes.draw do
  resources :guard_prisoners
  resources :incident_types
  resources :incident_participants
  resources :incident_reports
  resources :cells
  resources :cell_blocks
  resources :prisoners
  resources :guards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

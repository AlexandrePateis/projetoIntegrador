Rails.application.routes.draw do
  resources :appointments
  get 'reports', to: 'reports#index'
  resources :clients
  resources :addresses
  root 'dashboard#index'
  resources :services
  get "up" => "rails/health#show", as: :rails_health_check

end

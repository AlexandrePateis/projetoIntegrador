Rails.application.routes.draw do
  resources :appointments
  resources :clients
  resources :addresses
  root 'dashboard#index'
  resources :services
  get "up" => "rails/health#show", as: :rails_health_check

end

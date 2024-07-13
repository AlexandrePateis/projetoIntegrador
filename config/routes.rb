Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  get 'reports', to: 'reports#index'
  resources :clients
  resources :addresses
  root 'dashboard#index'
  resources :services
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

end

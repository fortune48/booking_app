Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users
  resources :appointments
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end

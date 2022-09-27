Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users
  resources :appointments
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  get "homes/health_information"
  get "homes/emergency_department"
  get "homes/primary_health_care_department"
  get "homes/children_ward_department"
  get "homes/events"
  get "homes/about_us"
  get "homes/contact_us"
end

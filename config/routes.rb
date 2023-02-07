Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "users", to: "users#index"
  get "users_client", to: "users#client"
  get "sign_up_user", to: "users#new"
  post "sign_up_user/:rol", to: "users#create"
  get "update_user", to: "users#edit"
  patch "sign_up", to: "users#update"

  get "sign_up_user_administrator", to: "administrators#new"
  post "sign_up_user_administrator", to: "administrators#create"

  get "sign_up_user_bank_staff", to: "bank_staffs#new"
  post "sign_up_user_bank_staff", to: "bank_staffs#create"

  get "request_appointment", to: "appointments#new"
  post "request_appointment", to: "appointments#create"
  get "appointment_management", to: "appointments#management"
  get "appointments_history", to: "appointments#history"
  post "cancel_appointment", to: "appointments#cancel"
  post "attend_appointment", to: "appointments#attend"
  post "appointment_schedule", to: "appointments#schedule"
  put "appointment_update", to:"appointments#update"
  post "appointment_update", to:"appointments#update"


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  delete "logout", to: "sessions#destroy"

  resources :users
  resources :appointments
  resources :branch_offices do
    resources :schedules
  end

  root to: "main#index"
end

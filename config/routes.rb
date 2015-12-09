Rails.application.routes.draw do
  root 'employees#index'
  
  devise_for :employees, controllers: {registrations: "employees/registrations"}
  devise_for :companies, controllers: {registrations: "companies/registrations"}

  get "/index" => "main#index", as: :index
  get "/empleadores" => "companies#index", as: :companies
  
  #Omniauth
  get 'auth/:provider/callback', to: 'oauth_sessions#create_oauth_session'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'oauth_sessions#destroy_oauth_session', as: :signout
  resources :sessions, only: [:create_oauth_session, :destroy_oauth_session]
end

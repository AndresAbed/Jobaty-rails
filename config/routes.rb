Rails.application.routes.draw do
  root 'employees#index'
  
  devise_for :employees, controllers: {
    registrations: "registrations", 
    sessions: "sessions",
    passwords: "passwords", 
    confirmations: "confirmations"
  }
  devise_for :companies, controllers: {
    registrations: "registrations", 
    sessions: "sessions",
    passwords: "passwords", 
    confirmations: "confirmations"
  }

  get "/index" => "main#index", as: :index
  get "/empleadores" => "companies#index", as: :companies
  get "/candidatos" => "companies#candidates", as: :candidates
  get "/perfil-empresa" => "companies#profile", as: :company_profile
  post "/empleadores" => "companies#contact", as: :contact

  get "/ofertas" => "employees#offers", as: :offers
  get "/perfil" => "employees#profile", as: :employee_profile
  get "/propuestas" => "employees#proposals", as: :employee_proposals
  get "/aceptadas" => "employees#acepted", as: :employee_acepted
  get "/rechazadas" => "employees#rejected", as: :employee_rejected
  get "/contacto-talento" => "employees#contact", as: :employee_contact
  post "/contacto-talento" => "employees#contact_form", as: :employee_contact_form
  
  #Omniauth
  get 'auth/:provider/callback', to: 'oauth_sessions#create_oauth_session'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'oauth_sessions#destroy_oauth_session', as: :signout
  resources :sessions, only: [:create_oauth_session, :destroy_oauth_session]
end

Rails.application.routes.draw do
  devise_scope :employee do
    root :to => 'main#employee'
  end
  devise_for :employees, controllers: {registrations: "registrations"}
  devise_for :companies

  get "/index" => "main#index", as: :index
  get "/empleadores" => "main#companies", as: :companies
  
  #Omniauth
  get 'auth/:provider/callback', to: 'oauth_sessions#create_oauth_session'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'oauth_sessions#destroy_oauth_session', as: :signout
  resources :sessions, only: [:create_oauth_session, :destroy_oauth_session]
end

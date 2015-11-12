Rails.application.routes.draw do
 
  devise_for :employees
  devise_scope :employee do
    unauthenticated :employee do
      root to: "devise/sessions#new"
    end
    #match '/sessions/employee', to: 'devise/sessions#create', via: :post
  end
  
  get "home/index", as: :home
  
  #Omniauth
  get 'auth/:provider/callback', to: 'sessions#create_oauth_session'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy_oauth_session', as: :signout
  resources :sessions, only: [:create_oauth_session, :destroy_oauth_session]
end

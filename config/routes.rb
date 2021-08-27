Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  root "sessions#home"

  # create custom routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  # sessions routes
  get '/login' => 'sessions#new' # opens new session
  post '/login' => 'sessions#create' # look up a user in the database, verify their login credentials, and then store the authenticated user's id in the session
  post '/logout' => 'sessions#destroy' # log the user out
  
  # not custom routes
  resources :users
  resources :sessions
  # nested routes
  resources :comments, only: [:new, :create, :index] #allows non nested index, create, new; without creating duplicate routes for the rest of actions
  resources :posts do
    resources :comments, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "sessions#home"

  # create custom routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  # sessions routes
  get '/login' => 'sessions#new' # opens new session
  post '/login' => 'sessions#create' # look up a user in the database, verify their login credentials, and then store the authenticated user's id in the session
  post '/logout' => 'sessions#destroy' # log the user out
  
  # not custom routes
  resources :comments, only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users
  resources :posts, only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

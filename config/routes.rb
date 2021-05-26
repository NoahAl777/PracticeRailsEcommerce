Rails.application.routes.draw do
  # create custom routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  # not custom routes
  resources :comments
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

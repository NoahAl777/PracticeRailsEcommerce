Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :users
  resources :emails
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

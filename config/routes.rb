Rails.application.routes.draw do
  resources :recipe_foods
  resources :foods
  get '/users', to: 'users#new'

  resources :recipes, only: [:index, :destroy, :new, :show]
  resources :users
end

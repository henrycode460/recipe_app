Rails.application.routes.draw do
  get 'foods/index'
  get 'users/index'
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index show]

  resources :foods, only: %i[index show new create destroy]

  get '/users/:id', to: 'users#show'
  get '/foods/new', to: 'foods#new'
  get '/foods/:id', to: 'foods#show'
end

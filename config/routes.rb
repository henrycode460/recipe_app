Rails.application.routes.draw do
  devise_for :users

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root 'users#new'
   
  resources :recipe_foods
  resources :foods
  get '/users', to: 'users#new'

  resources :users do
    resources :recipes, only: [:index, :destroy, :new, :show]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

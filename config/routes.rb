Rails.application.routes.draw do
  devise_for :users

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root 'foods#index'
   
  resources :foods #[:index, :destroy, :new, :show]
  get '/users', to: 'foods#index'

  resources :users 
  resources :recipe_foods #[:index, :destroy, :new, :show]
  resources :recipes, only: [:index, :destroy, :new, :create, :show]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

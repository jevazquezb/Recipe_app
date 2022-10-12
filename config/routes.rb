Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#public_recipes'
  get '/public_recipes', to: 'recipes#public_recipes'
  
  resources :foods, except: :update
end

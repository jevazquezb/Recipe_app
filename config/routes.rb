Rails.application.routes.draw do
  get '/recipes', to: "recipes#index"
  post '/recipes/create', to: "recipes#create"
  get '/recipes/create', to: "recipes#new"
  get '/recipes/:id', to: "recipes#show"
  get '/recipes/:id/add', to: "recipes#add_food_form"
  post "/recipes/destroy", to: "recipes#destroy"
  post "/recipes/add_recipe_food", to: "recipes#add_recipe_food"
  get "recipes/:id/update/:id", to: "recipes#edit_ingrediant"
  post "/recipes/ingredint/destroy", to: "recipes#remove_ingrediant"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#public_recipes'
  get '/public_recipes', to: 'recipes#public_recipes'
  
  resources :foods, except: :update
  resources :general_shopping_list, only: :index
end

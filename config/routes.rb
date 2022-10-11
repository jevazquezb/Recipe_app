Rails.application.routes.draw do
  get 'general_shopping_list/index'
  get '/recipes', to: "recipes#index"
  post '/recipes/create', to: "recipes#create"
  get '/recipes/create', to: "recipes#new"
  get '/recipes/:id', to: "recipes#show"
  get 'recipes/public_recipes'
  post "/recipes/remove", to: "recipes#remove"
  get 'foods/index'
  get 'foods/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

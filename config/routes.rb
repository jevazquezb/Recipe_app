Rails.application.routes.draw do
  get 'general_shopping_list/index'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/public_recipes'
  get 'foods/index'
  get 'foods/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

class RecipesController < ApplicationController
  def index
    @all_recipes = Recipe.all
  end

  def show
    @single_recipe = Recipe.find_by(id: params[:id])
  end

  def add_food_form
    @recipe_id = params[:id]
    @foods = Food.all
  end

  def add_recipe_food
    RecipeFood.create(quantity: params[:quantity], recipe_id: params[:recipe_id], food_id: params[:food_id])
    redirect_to "/recipes/#{params[:recipe_id]}"
  end

  def new; end

  def destroy
    Recipe.destroy_by(id: params[:id])
    redirect_to '/recipes'
  end

  def create
    Recipe.create(
      name: params[:name],
      preparation_time: params[:preparation_time],
      cooking_time: params[:cooking_time],
      description: params[:description],
      public: params[:public],
      user_id: params[:user_id]
    )
    redirect_to '/recipes'
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc).includes(:user)
  end
end

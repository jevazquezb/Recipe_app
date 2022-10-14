class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[show public_recipes]

  def index
    @all_recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @single_recipe = Recipe.find_by(id: params[:id])
  end

  def add_food_form
    @recipe_id = params[:id]
    @foods = Food.all
  end

  def add_recipe_food
    @recfoo_cre = RecipeFood.create(quantity: params[:quantity], recipe_id: params[:recipe_id], food_id: params[:food_id])
    authorize! :create, @recfoo_cre
    redirect_to "/recipes/#{params[:recipe_id]}"
  end

  def edit_ingrediant
    @editable_recipe_food = RecipeFood.find_by(id: params[:id])
    @foods = Food.all
  end

  def update_recipe_food
    @rfupdate = RecipeFood.find_by(id: params[:id])
    @rfupdate.update(quantity: params[:quantity])
    authorize! :modify, @rfupdate
    redirect_to "/recipes/#{params[:recipe_id]}"
  end

  def remove_ingrediant
    @recfoo_des = RecipeFood.find(params[:rf_id])
    @recfoo_des.destroy
    authorize! :modify, @recfoo_des
    # RecipeFood.destroy_by(id: params[:rf_id])
    redirect_to "/recipes/#{params[:r_id]}"
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
    puts current_user
    @public_recipes = Recipe.where(public: true).order(created_at: :desc).includes(:user)
  end
end

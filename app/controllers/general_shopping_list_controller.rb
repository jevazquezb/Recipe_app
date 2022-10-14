class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @missing_food = []
    current_user.foods.each do |food|
      food_quantity = food.quantity
      food_required = food.recipe_foods.sum { |recipe_food| recipe_food[:quantity] }
      diff = food_required - food_quantity
      @missing_food << { name: food.name, quantity: diff, price: food.price * diff } if diff.positive?
    end
    @total_price = @missing_food.sum { |food| food[:price] }
    @amount_of_items = @missing_food.length
  end
end

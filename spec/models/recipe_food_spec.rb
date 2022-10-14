require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )
    @recipe = Recipe.create(
      name: 'Sabroso',
      preparation_time: 1.0,
      cooking_time: 1.0,
      description: 'My mouth is watering',
      user_id: @user.id,
      public: true
    )
    @food = Food.create(
      name: 'Tomato',
      measurement_unit: 'kgs',
      price: 2.5,
      quantity: 10,
      user_id: @user.id
    )
    @recipe_food = RecipeFood.create(
      quantity: 12,
      food_id: @food.id,
      recipe_id: @recipe.id
    ) 
  end

  it 'quantity should be greater than zero' do
    @recipe_food.quantity = 0
    expect(@recipe_food).to_not be_valid
  end

  it 'RecipeFood should be valid' do
    expect(@recipe_food).to be_valid
  end
end

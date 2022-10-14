require 'rails_helper'

RSpec.describe 'General Shopping List Index Page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    sign_in @user

    (1..5).each do |id|
      Food.create(
        name: "Food #{id}",
        measurement_unit: 'kgs',
        price: 2.5,
        quantity: 4.7,
        user_id: @user.id
      )
    end

    @recipe = Recipe.create(
      name: 'Sabroso',
      preparation_time: 1.3,
      cooking_time: 0.45,
      description: 'My mouth is watering',
      user_id: @user.id,
      public: true
    )

    @food_list = Food.where(user_id: @user.id)

    @food_list.each do |food|
      RecipeFood.create(quantity: 10, recipe_id: @recipe.id, food_id: food.id)
    end

    visit general_shopping_list_index_path
  end

  it 'should have 5 foods' do
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Food 2')
    expect(page).to have_content('Food 3')
    expect(page).to have_content('Food 4')
    expect(page).to have_content('Food 5')
  end

  it 'should show the amount of food needed' do
    expect(page).to have_content('Amount of food items to buy: 5')
  end

  it 'should show the total price for the food' do
    expect(page).to have_content('Total value of food needed: $66.25')
  end
end

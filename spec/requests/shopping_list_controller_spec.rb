require 'rails_helper'

RSpec.describe 'GeneralShoppingLists', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    sign_in @user

    @food = Food.create(
      name: 'Tomato',
      measurement_unit: 'kgs',
      price: 2.5,
      quantity: 10,
      user_id: @user.id
    )

    @recipe = Recipe.create(
      name: 'Sabroso',
      preparation_time: 1.3,
      cooking_time: 0.45,
      description: 'My mouth is watering',
      user_id: @user.id,
      public: true
    )

    RecipeFood.create(
      quantity: 4.7,
      recipe_id: @recipe.id,
      food_id: @food.id
    )
  end

  describe '/general_shopping_list route (GET #index)' do
    before { get general_shopping_list_index_path }

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text' do
      expect(response.body).to include('Total value of food needed:')
    end
  end
end

require 'rails_helper'

RSpec.describe Recipe, type: :model do
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
  end

  it 'name should be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'description should be present' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation time should be greater than zero' do
    @recipe.preparation_time = 0
    expect(@recipe).to_not be_valid
  end

  it 'cooking time should be greater than zero' do
    @recipe.cooking_time = 0
    expect(@recipe).to_not be_valid
  end

  it 'Recipe should be valid' do
    expect(@recipe).to be_valid
  end
end

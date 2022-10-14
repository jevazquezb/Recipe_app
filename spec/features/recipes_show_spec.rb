require 'rails_helper'

RSpec.describe 'Recipes Show Page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )

    sign_in @user

    @recipe = Recipe.create(
      name: 'Sabroso',
      preparation_time: 1.3,
      cooking_time: 0.45,
      description: 'My mouth is watering',
      user_id: @user.id,
      public: true
    )

    visit "/recipes/#{@recipe.id}"
  end

  it 'should have a name' do
    expect(page).to have_content('Sabroso')
  end

  it 'should have a preparation time' do
    expect(page).to have_content('Preparation time: 1.3 hrs')
  end

  it 'should have a cooking time' do
    expect(page).to have_content('Cooking time: 0.45 hrs')
  end
end
require 'rails_helper'

RSpec.describe 'Recipes index page', type: :feature do
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
      Recipe.create(
        name: "Recipe #{id}",
        preparation_time: 1.3,
        cooking_time: 0.45,
        description: 'My mouth is watering',
        user_id: @user.id,
        public: true
      )
    end
    
    visit recipes_path
  end

  it 'should have 5 recipes' do
    expect(page).to have_content('Recipe 1')
    expect(page).to have_content('Recipe 2')
    expect(page).to have_content('Recipe 3')
    expect(page).to have_content('Recipe 4')
    expect(page).to have_content('Recipe 5')
  end

  it 'should have an add food button' do
    expect(page).to have_link('Add recipe')
  end

  it 'add food button should redirect to new food page' do
    click_link('Add recipe')
    expect(current_path).to eq('/recipes/create')
  end
end
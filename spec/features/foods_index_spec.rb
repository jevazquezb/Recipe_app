require 'rails_helper'

RSpec.describe 'Food index page', type: :feature do
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
        quantity: 10,
        user_id: @user.id
      )
    end

    visit foods_path
  end

  it 'should have 5 foods' do
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Food 2')
    expect(page).to have_content('Food 3')
    expect(page).to have_content('Food 4')
    expect(page).to have_content('Food 5')
  end

  it 'should have an add food button' do
    expect(page).to have_link('Add food')
  end

  it 'add food button should redirect to new food page' do
    click_link('Add food')
    expect(current_path).to eq(new_food_path)
  end
end

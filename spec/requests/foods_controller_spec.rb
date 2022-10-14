require 'rails_helper'

RSpec.describe 'Foods', type: :request do
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
  end

  context '/foods route (GET #index)' do
    before(:each) { get foods_path }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it "should render index.html.erb file from views/recipes (render 'index' template)" do
      expect(response).to render_template('index')
    end

    it "should render the correct content in the 'index' template" do
      expect(response.body).to include('Unit Price')
    end
  end
end

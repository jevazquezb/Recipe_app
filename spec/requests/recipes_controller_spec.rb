require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
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
      preparation_time: 1.0,
      cooking_time: 1.0,
      description: 'My mouth is watering',
      user_id: @user.id,
      public: true
    )
  end

  context '/recipes route (GET #index)' do
    before(:each) { get '/recipes' }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it "should render index.html.erb file from views/recipes (render 'index' template)" do
      expect(response).to render_template('index')
    end

    it "should render the correct content in the 'index' template" do
      expect(response.body).to include('list')
    end
  end

  context '/recipes/:id route (GET #show)' do
    before(:each) { get "/recipes/#{@recipe.id}" }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it "should render show.html.erb file from views/recipes (render 'show' template)" do
      expect(response).to render_template('show')
    end

    it "should render the correct content in the 'show' template" do
      expect(response.body).to include("#{@recipe.name}")
    end
  end
end

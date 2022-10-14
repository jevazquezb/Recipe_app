require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(
      name: 'Jesus',
      email: 'jesus@email.com',
      password: '112233',
      password_confirmation: '112233',
      confirmed_at: Time.now
    )
    @user.skip_confirmation!
    @user.save!
    @food = Food.create(
      name: 'Tomato',
      measurement_unit: 'kgs',
      price: 2.5,
      quantity: 10,
      user_id: @user.id
    )
  end

  context 'Food Model Properties' do
    it 'name should be present' do
      @food.name = 'Tomato'
      expect(@food).to be_valid
    end

    it 'measurement_unit should be present' do
      @food.measurement_unit = 'kgs'
      expect(@food).to be_valid
    end

    it 'price should be present' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'quantity should be present' do
      @food.quantity = nil
      expect(@food).to_not be_valid
    end

    it 'user_id should be present' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end
end

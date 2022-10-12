class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @food.save
          flash[:notice] = "Food saved successfully"
          redirect_to foods_path
        else
          flash.now[:alert] = "Food not saved"
          render :new
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = 'Food was deleted!'
    redirect_to request.referrer
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  private :food_params
end

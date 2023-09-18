class FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @foods = current_user.foods
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food item deleted successfully.'
  end

  private

  def food_params
    params.require(:food).permit(:food, :unit_price, :measurement_unit)
  end
end

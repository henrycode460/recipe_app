class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
    @current_user = current_user
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.valid?
      @food.save
      flash[:success] = "#{@food.name} was successfully created"
      redirect_to foods_url

    else
      flash[:alert] = "#{@food.name} was not created"
      redirect_to new_food_url
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

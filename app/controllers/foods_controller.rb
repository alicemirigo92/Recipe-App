class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show
    @food = Food.find(params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # # GET /foods/1/edit
  # def edit; end

  # POST /foods or /foods.json
  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_path(@food, current_user), notice: 'Food successfully added!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    if @food&.destroy
      redirect_to foods_path, notice: 'Food successfully deleted!'
    else
      render 'new', notice: 'Something went wrong!'
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
